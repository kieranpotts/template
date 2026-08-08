# Plan: Repository settings as code

## Context

The goal is a version-controlled, PR-reviewable `.github/settings.yml` that
declares this repository's GitHub configuration — repository settings,
labels, branch protection, and more — with a mechanism to apply it to
GitHub automatically. Trial this in the `template` repository first, then
roll it out across all of Kieran Potts' personal repositories.

## Options considered

| Approach | How it runs | Trust model | Notes |
|---|---|---|---|
| Hosted Probot app ([`apps/settings`](https://github.com/apps/settings)) | Third-party hosted service, triggered by webhook | Third party sees `settings.yml` contents and calls the GitHub API on your behalf | Zero infra, simplest to install, but a standing external dependency |
| **Self-run GitHub Action (chosen)** | Runs in this repo's own Actions | Nothing leaves your infrastructure; you hold the admin-scoped token | Same `settings.yml` format as the Probot app; visible workflow-run logs instead of a silent webhook sync |
| Terraform GitHub provider | `terraform plan`/`apply`, run locally or in CI | You hold the token; state file needs a backend | Best fit if managing *all* repos from one place matters more than a `settings.yml` per repo; more tooling overhead |
| [`safe-settings`](https://github.com/github/safe-settings) | Hosted app or scheduled Action, central admin repo | Depends on deployment | Built for GitHub **organizations** (teams, org policy inheritance) — a mismatch for standalone personal-account repos |

**Decision: self-run GitHub Action**, using
[`Vivswan/repo-settings-as-code`](https://github.com/Vivswan/repo-settings-as-code).
It reads the same `settings.yml` format as the Probot app (so nothing
already written needs to change), adds a `mode: check` for drift-reporting
without writing, and — critically — removes the third-party hosted-service
dependency. The privilege-escalation risk doesn't disappear (the workflow
still needs an admin-scoped token to do anything), but it moves from "an
external app has standing access" to "a secret you control triggers a
workflow you control," which is a smaller trust surface.

Note: GitHub's built-in `GITHUB_TOKEN` has **no `administration` scope**,
so this still requires a fine-grained PAT with `Administration: write`
(plus write access to whichever other `settings.yml` sections are used),
stored as a repository secret. See
[docs/development/repository-settings.md](./docs/development/repository-settings.md)
for the exact scopes.

## What can be configured

| Key | Covers |
|---|---|
| `repository` | name, description, homepage, topics, `private`, `has_issues`/`has_projects`/`has_wiki`/`has_downloads`, `default_branch`, merge strategies, `delete_branch_on_merge`, vulnerability/security-fix toggles |
| `labels` | label name/color/description set |
| `milestones` | milestone definitions |
| `branches` (branch protection rules) | required PR reviews, required status checks, `enforce_admins`, `required_linear_history`, push restrictions — each top-level protection block must be present or explicitly `null`, or it won't apply |
| `collaborators` | individual user permissions |
| `teams` | team permissions |
| `environments` | environment-specific config |
| *(Action-only extras)* | `rulesets`, `actions`/`actions_secrets`/`dependabot_secrets`/`codespaces_secrets`, `webhooks`, `pages`, `code_scanning_default_setup`, `custom_properties`, `deploy_keys`, and more — see the [Action's README](https://github.com/Vivswan/repo-settings-as-code) |

## Inheritance

`settings.yml` supports inheriting from another repo's `settings.yml` and
overriding only what differs — array elements merge by matching `name`.
This fits the template-repo model well: define a canonical `settings.yml`
(likely in the [`.github`](https://github.com/kieranpotts/.github) repo,
alongside the existing `labels.json`), and have each repo's own
`settings.yml` extend/override it rather than duplicate it. Confirm the
exact inheritance syntax in
[docs/configuration.md](https://github.com/repository-settings/app/blob/master/docs/configuration.md)
before committing to a structure — this behavior comes from the original
Probot format, so it should carry over, but hasn't been verified against
`Vivswan/repo-settings-as-code` specifically.

## Steps

1. **Done.** Added [`.github/settings.yml`](./.github/settings.yml) to
   `template` as an as-is snapshot of the repo's live settings, verified
   field-by-field against `gh api` so the first apply is a no-op. Covers
   the full `repository:` field list, `labels`, and `branches`.
   `milestones`, `collaborators`, `teams`, and `environments` are omitted
   as this repo currently has none of any of them.
2. **Done.** Added [`.github/workflows/apply-settings.yaml`](./.github/workflows/apply-settings.yaml),
   running `Vivswan/repo-settings-as-code` on push to `.github/settings.yml`
   (and on manual dispatch), pinned to a commit SHA per this repo's
   convention for third-party actions.
3. **Manual step, not done by this plan.** Create a fine-grained PAT with
   `Administration: write` (see
   [docs/development/repository-settings.md](./docs/development/repository-settings.md)
   for the full scope list) and add it as the `ADMIN_TOKEN` repository
   secret. Without this, the workflow will run and fail loudly rather than
   silently — that's by design, but nothing will actually apply until the
   secret exists.
4. **Not yet done.** Once the secret exists, trigger the workflow (push a
   no-op change, or `workflow_dispatch`) and confirm the run succeeds with
   zero diffs, proving the snapshot is accurate.
5. **Open decision.** `template` already runs `sync-labels.yaml`, syncing
   labels from `kieranpotts/.github` via
   [EndBug/label-sync](https://github.com/EndBug/label-sync).
   `settings.yml` also now declares `labels`. Two systems own the same
   state; decide whether to drop `labels` from `settings.yml` and keep
   `sync-labels`, or retire `sync-labels` and let `settings.yml` be
   authoritative — don't run both indefinitely.
6. **Open decision.** `settings.yml` has a `branches:` entry for
   `latest/dev` with `protection: null`, matching the fact that the branch
   is currently unprotected. `template` is solo-maintained and takes
   commits straight to `latest/dev`; turning on required reviews, required
   status checks, or `enforce_admins` is a policy change to make
   deliberately, not a side effect of this rollout.
7. Once proven on `template`, decide how to scale out: either copy
   `apply-settings.yaml` + a `settings.yml` into each repo (using
   inheritance from a canonical base in `kieranpotts/.github`), or
   reconsider the Terraform option if managing all repos from one place
   turns out to matter more than per-repo visibility.

## Sources

- [probot/settings README](https://github.com/probot/settings/blob/master/README.md)
- [apps/settings on GitHub](https://github.com/apps/settings)
- [repository-settings/app docs/configuration.md](https://github.com/repository-settings/app/blob/master/docs/configuration.md)
- [repository-settings/app docs/plugins/branches.md](https://github.com/repository-settings/app/blob/master/docs/plugins/branches.md)
- [repository-settings/app docs/plugins/repository.md](https://github.com/repository-settings/app/blob/master/docs/plugins/repository.md)
- [repository-settings/app docs/self-host.md](https://github.com/repository-settings/app/blob/master/docs/self-host.md)
- [Vivswan/repo-settings-as-code](https://github.com/Vivswan/repo-settings-as-code)
- [Terraform GitHub provider](https://registry.terraform.io/providers/integrations/github/latest/docs)
- [github/safe-settings](https://github.com/github/safe-settings)
- [GitHub Docs: controlling permissions for GITHUB_TOKEN](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/controlling-permissions-for-github_token)
