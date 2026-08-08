# Plan: Adopt the GitHub Settings app

## Context

[Repository Settings](https://github.com/apps/settings) (the `probot/settings`
app, listed on GitHub as `apps/settings`) is a Probot-based GitHub App that
syncs a `.github/settings.yml` file in a repo to that repo's actual GitHub
configuration — repository settings, labels, branch protection,
collaborators, teams, environments, milestones. Install the app, commit
`.github/settings.yml` to the default branch, and every push touching that
file makes the app read it and call the GitHub API to apply the described
state. This turns repo configuration into version-controlled,
PR-reviewable code.

The intent is to trial this in the `template` repository first, then roll it
out across all of Kieran Potts' personal repositories.

## What can be configured

| Key | Covers |
|---|---|
| `repository` | name, description, homepage, topics, `private`, `has_issues`/`has_projects`/`has_wiki`, `default_branch`, merge strategies (`allow_squash_merge` etc.), `delete_branch_on_merge`, vulnerability/security-fix toggles |
| `labels` | label name/color/description set |
| `milestones` | milestone definitions |
| `branches` (branch protection rules) | required PR reviews, required status checks, `enforce_admins`, `required_linear_history`, push restrictions (apps/users/teams) — each top-level protection block must be present or explicitly `null`, or it won't apply |
| `collaborators` | individual user permissions |
| `teams` | team permissions |
| `environments` | environment-specific config |

Example:

```yaml
repository:
  name: repo-name
  description: description of repo
  private: false
  has_issues: true
  default_branch: main
  delete_branch_on_merge: true

labels:
  - name: bug
    color: d73a4a

branches:
  - name: main
    protection:
      required_pull_request_reviews:
        required_approving_review_count: 1
        require_code_owner_reviews: true
      required_status_checks:
        strict: true
        contexts: []
      enforce_admins: true
      restrictions: null
```

## Inheritance

`settings.yml` supports inheriting from another repo's `settings.yml` and
overriding only what differs — array elements merge by matching `name`.
This fits the template-repo model well: define a canonical `settings.yml`
(likely in the [`.github`](https://github.com/kieranpotts/.github) repo,
alongside the existing `labels.json`), and have each repo's own
`settings.yml` extend/override it rather than duplicate it. Confirm the
exact inheritance syntax in
[docs/configuration.md](https://github.com/repository-settings/app/blob/master/docs/configuration.md)
before committing to a structure.

## Important caveat: privilege escalation

Because the app applies whatever is pushed to the default branch, **anyone
with push access to that branch effectively gets admin rights** over the
repo's settings (branch protection, collaborator access, etc.) via
`settings.yml`. The maintainers explicitly flag this and recommend a
`CODEOWNERS` entry requiring an admin's review on any PR touching
`.github/settings.yml`. This needs to be locked down before rollout — not
just for the template repo, but for every repo the app is installed on.

## Hosted vs. self-hosted

- **Hosted** (what `apps/settings` is): install directly from GitHub, no
  infra to run. Simplest path for this use case.
- **Self-hosted**: install the `@repository-settings/app` npm package into
  a self-run Probot service, or fork the repo. Needs a Node runtime, a
  GitHub App with its own credentials (`APP_ID`, `PRIVATE_KEY`,
  `WEBHOOK_SECRET`), and webhook handling for push/repository events. Only
  worth it for privacy/control needs beyond what's needed here.

Decision: use the hosted app.

## Steps

1. Install the hosted app on the `template` repo only.
2. Add `.github/settings.yml` to `template`, verify it applies correctly
   (labels, branch protection, etc.).
3. Reconcile with the existing `.github` repo's `push-labels` and
   `flag-stale-issues` workflows, which already touch labels/repo state —
   avoid two systems fighting over the same config. Decide whether
   `settings.yml` labels supersede `labels.json`, or whether the two must
   be kept consistent.
4. Add a `CODEOWNERS` rule requiring review on changes to
   `.github/settings.yml`.
5. Once proven on `template`, install the app org-wide (or per-repo) and
   let each repo's `settings.yml` inherit from a canonical base — likely
   hosted in the `.github` repo.

## Sources

- [probot/settings README](https://github.com/probot/settings/blob/master/README.md)
- [apps/settings on GitHub](https://github.com/apps/settings)
- [repository-settings/app docs/configuration.md](https://github.com/repository-settings/app/blob/master/docs/configuration.md)
- [repository-settings/app docs/plugins/branches.md](https://github.com/repository-settings/app/blob/master/docs/plugins/branches.md)
- [repository-settings/app docs/plugins/repository.md](https://github.com/repository-settings/app/blob/master/docs/plugins/repository.md)
- [repository-settings/app docs/self-host.md](https://github.com/repository-settings/app/blob/master/docs/self-host.md)
