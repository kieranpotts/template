# TODO — Drift from the repository template

Findings from comparing every active (non-archived) personal project against
this template's structure and conventions, as of 2026-08-12. Archived
repositories (`devboxes`, `eslint-config`, `genies`, `makebook`, `modelfiles`,
`ocean`, `prototypes`, `sh`, `tests`, `website-ui`, `nirvarnia/brand`) were
excluded — they're no longer maintained, so drift there doesn't matter.

Method: structural presence/absence of the files this template ships with
(`README.md`, `AGENTS.md`, `CLAUDE.md`, `CONTRIBUTING.md`, `SECURITY.md`,
`LICENSE.txt`, `CHANGELOG.md`, `Makefile`, `run/*`, `.editorconfig`,
`.pre-commit-config.yaml`, `.devcontainer/`, `.vscode/`, `.zed/`,
`.agents/skills/`, `.claude/skills`, `docs/README.md`), plus spot checks of
`AGENTS.md` section structure, the `.claude/skills` symlink target, and
`Makefile`/`run/` script pairing. This is not a full content review of every
file in every repository — see each entry for what was actually checked.

This is an analysis artifact, not a work plan — the checkboxes record
findings, not commitments to act on all of them. Some of what's listed below
is legitimate, deliberate divergence (a docs-only template repo has no reason
to grow a `Makefile`); triage each item before treating it as a bug.

## Cross-cutting patterns

These showed up in enough repositories that repeating them 44 times below
would just be noise. Read this section once; the per-repository entries below
only call them out where there's something repo-specific to add.

- [ ] **`SECURITY.md` has 0/44 adoption.** Every active repo is missing it,
  including ones that ship reusable tooling other people (or other repos)
  might consume — `actions`, `gitex`, `pre-commit-hooks`, `skills`, `genie`,
  `pi`, `docker-devcontainer`, `docker-latex`. Either the template's
  `SECURITY.md` doesn't fit a personal-project portfolio and should be
  dropped, or it should be rolled out to at least the repos with external
  consumers.

- [ ] **AGENTS.md's `## Team` section has 0/44 adoption.** Makes sense — this
  is a single-maintainer portfolio, and the template's placeholder
  Product Owner/Tech Lead/Security Lead/etc. roster doesn't apply. Worth
  updating the template itself to drop or rework this section rather than
  leaving every consumer to silently delete it.

- [ ] **`run/build`, `run/clean`, `run/install`, `run/lint`, `run/test` see
  almost no adoption** (1–3 repos each), while `Makefile` targets with the
  same names are common (18/44 repos). Where a `Makefile` exists, its
  targets almost always inline the command directly rather than delegating
  to a same-named `run/` script. `run/version` is the one script with real
  uptake (6/44), always correctly paired with a `CHANGELOG.md`. This is a
  systemic divergence from the template's "`Makefile` is a thin wrapper
  around `run/`" pattern — either that pattern isn't earning its keep and
  the template should just document Makefile targets directly, or the
  convention needs to actually be applied where a `Makefile` exists.

- [ ] **`CONTRIBUTING.md` (16/44), `CHANGELOG.md` (11/44), and `Makefile`
  (18/44) adoption tracks whether a repo builds/ships something**, which is
  a reasonable and probably-intentional split rather than drift. Pure
  content/config repos (cheats, dictionary, interviews, papers, thoughts,
  study, popos, kieranpotts profile) skip all three; tooling repos mostly
  have at least a `Makefile`.

- [ ] **The two `srcflow/*` repositories carry none of these conventions** —
  no `AGENTS.md`, no `CLAUDE.md`, no `docs/` structure, nothing. They're a
  separate GitHub org, so this may be a deliberate boundary rather than an
  oversight — worth an explicit decision either way (see their entries
  below) rather than leaving it ambiguous.

## Per-repository findings

### `kieranpotts/.github`

- [ ] No `CONTRIBUTING.md`, `CHANGELOG.md`, `Makefile`, `run/`, or
  `docs/README.md` — reasonable for a community-health-files repo with no
  build/release lifecycle of its own.
- [ ] `AGENTS.md` has no `## Skills` section and no `.agents/skills/` —
  consistent with there being no skills defined here yet.

### `kieranpotts/actions`

- [ ] No `LICENSE.txt`, despite shipping reusable GitHub Actions other repos
  consume — worth adding given the external-reuse angle.
- [ ] No `CONTRIBUTING.md`, `CHANGELOG.md`, `Makefile`/`run/`, or skills
  scaffolding.

### `kieranpotts/asciibook`

- [ ] `docs/` exists but has no `docs/README.md` index — inconsistent with
  the template's doc-directory convention.
- [ ] `Makefile` exists (`build`/`start`/`stop`) but only `run/build` exists
  among the `run/` scripts it could delegate to; `start`/`stop` are inlined.
- [ ] No `CONTRIBUTING.md`, `CHANGELOG.md`, or skills scaffolding.

### `kieranpotts/audits`

- [ ] Closest to full template conformance of any repo checked: has
  `CONTRIBUTING.md`, `docs/README.md`, `.agents/skills/README.md`, and a
  correctly-linked `.claude/skills` symlink.
- [ ] No `Makefile`/`run/` — reasonable for a docs-only template repo with
  nothing to build, lint, or test.

### `kieranpotts/avatar`

- [ ] No `LICENSE.txt`, `CONTRIBUTING.md`, `CHANGELOG.md`, `Makefile`/`run/`,
  or skills scaffolding — plausible for a small assets repo, but confirm
  that's the intent rather than an oversight.

### `kieranpotts/blueprints`

- [ ] No `CONTRIBUTING.md`, `CHANGELOG.md`, `Makefile`/`run/`, or skills
  scaffolding. Content-only repo, so likely fine.

### `kieranpotts/bookmarks`

- [ ] `.agents/skills/add-bookmark/` exists (with its own `SKILL.md` and
  `README.md`) but there's no top-level `.agents/skills/README.md` index —
  the template requires every skill to be listed there. The `.claude/skills`
  symlink is present and correctly targets `../.agents/skills`.
- [ ] No `CHANGELOG.md` or `Makefile`/`run/`.

### `kieranpotts/bootstrap`

- [ ] `.agents/skills/` exists but has no top-level `README.md` index, same
  gap as `bookmarks`. `.claude/skills` symlink is present.
- [ ] `docs/` exists but has no `docs/README.md`.
- [ ] `Makefile` has `install`/`version` targets; only `run/install` and
  `run/version` exist among `run/` scripts — `build`/`clean`/`lint`/`test`
  aren't defined either way, which is fine if there's nothing to build/lint.
- [ ] No `CONTRIBUTING.md`.

### `kieranpotts/cheats`

- [ ] No `CONTRIBUTING.md`, `CHANGELOG.md`, `Makefile`/`run/`, or skills
  scaffolding. Content-only repo, likely fine.

### `kieranpotts/cover-letter`

- [ ] No `LICENSE.txt`, `CONTRIBUTING.md`, or `CHANGELOG.md`.
- [ ] `Makefile` has a `build` target; no `run/build` script backs it (it's
  inlined) and none of the other `run/` scripts exist.

### `kieranpotts/design`

- [ ] No `Makefile`/`run/` — reasonable, docs-only template repo like
  `audits`.
- [ ] Otherwise closely matches the template: `CONTRIBUTING.md`,
  `docs/README.md`, `.agents/skills/README.md`, `.claude/skills` all present.

### `kieranpotts/devtools`

- [ ] No `CONTRIBUTING.md`, `CHANGELOG.md`, or skills scaffolding.
- [ ] `Makefile` has an `install` target backed by `run/install`; no
  `build`/`clean`/`lint`/`test` targets or scripts — fine if there's nothing
  to build/lint here.

### `kieranpotts/dictionary`

- [ ] Thinnest of the active repos: no `LICENSE.txt`, `CONTRIBUTING.md`,
  `SECURITY.md`, `CHANGELOG.md`, `Makefile`/`run/`,
  `.pre-commit-config.yaml`, or `.devcontainer/` at all. Confirm this is
  intentional for a spelling-dictionary repo rather than it having been
  skipped when the other repos were bootstrapped from the template.

### `kieranpotts/docker-devcontainer`

- [ ] No `CONTRIBUTING.md` or skills scaffolding.
- [ ] `Makefile` (`build`/`publish`/`version`) only partially backed by
  `run/` — `run/build` and `run/version` exist, `publish` is inlined with no
  `run/` counterpart.

### `kieranpotts/docker-latex`

- [ ] No `CONTRIBUTING.md`, `run/version`, or skills scaffolding.
- [ ] `Makefile` (`build`/`publish`) only `build` has a matching `run/build`;
  `publish` is inlined.

### `kieranpotts/dotfiles`

- [ ] No `CONTRIBUTING.md` or skills scaffolding.
- [ ] `Makefile` has `install`/`version` targets correctly backed by
  `run/install` and `run/version`; `build`/`clean`/`lint`/`test` aren't
  defined either way.

### `kieranpotts/garden`

- [ ] No `Makefile`→`run/` delegation at all — the `Makefile` defines 10+
  content-maintenance targets (`cultivate`, `entwine`, `fertilize`, `forage`,
  `graft`, `harvest`, `prune`, `sow`, `split`, `tend`) that don't map onto the
  template's `install/build/test/lint/version/clean` vocabulary in the first
  place. This looks like a deliberately different, skill-driven task runner
  rather than drift — worth deciding whether the template's `run/`
  convention should flex to cover this shape of repo, or whether `garden` is
  just a legitimate exception.
- [ ] No `CHANGELOG.md`.

### `kieranpotts/genie`

- [ ] No `.agents/skills/` or `.claude/skills` — no skills defined here.
- [ ] `Makefile` (`install`/`startup`/`log`/`lint`/`fix`/`typecheck`/`test`/
  `check`) is backed by `run/install`, `run/lint`, `run/test`, but most
  targets are inlined; `build`/`clean`/`version` aren't defined.
- [ ] No `CHANGELOG.md`.

### `kieranpotts/gitex`

- [ ] No `CONTRIBUTING.md`, `CHANGELOG.md`, `Makefile`/`run/`, or skills
  scaffolding — notable for a repo that ships a Git extensions suite other
  tooling could plausibly depend on.

### `kieranpotts/interviews`

- [ ] No `LICENSE.txt`, `CONTRIBUTING.md`, `CHANGELOG.md`,
  `.pre-commit-config.yaml`, `Makefile`/`run/`, or skills scaffolding.
  Content-only repo, likely fine as-is.

### `kieranpotts/json-schema`

- [ ] No `CONTRIBUTING.md`, `CHANGELOG.md`, `Makefile`/`run/`, or skills
  scaffolding — worth a `CHANGELOG.md`/`run/version` pairing at least, since
  this is a schema-definitions repo other projects could reasonably pin a
  version of.

### `kieranpotts/kieranpotts`

- [ ] No `LICENSE.txt`, `CONTRIBUTING.md`, `CHANGELOG.md`, `Makefile`/`run/`,
  or skills scaffolding. GitHub profile repo, likely intentional.

### `kieranpotts/loop`

- [ ] No `run/build`, `run/clean`, or `run/version` — `Makefile` has
  `install`/`lint`/`test` backed by matching `run/` scripts, so the pattern
  is followed where it applies; the gaps look like "nothing to build/version
  yet" rather than drift.
- [ ] Otherwise strong template conformance: `CONTRIBUTING.md`,
  `CHANGELOG.md`, `.agents/skills/README.md`, `.claude/skills`,
  `docs/README.md` all present.

### `kieranpotts/lumex`

- [ ] No `Makefile` at all, despite this being a VS Code theme with
  presumably a build/package step. Confirm whether packaging is manual or
  whether a `Makefile`/`run/` pair got dropped.
- [ ] Otherwise close to full conformance: `CONTRIBUTING.md`,
  `CHANGELOG.md`, `.agents/skills/README.md`, `.claude/skills`,
  `docs/README.md` all present.

### `kieranpotts/papers`

- [ ] Same thin profile as `dictionary`/`interviews`: no `LICENSE.txt`,
  `CONTRIBUTING.md`, `CHANGELOG.md`, `.pre-commit-config.yaml`,
  `.devcontainer/`, `Makefile`/`run/`, or skills scaffolding.

### `kieranpotts/pi`

- [ ] No `.agents/skills/`, `.claude/skills`, `docs/README.md`, or
  `CHANGELOG.md`.
- [ ] `Makefile` (`install`/`lint`/`fix`/`typecheck`/`test`/`check`) backed by
  `run/install`, `run/lint`, `run/test`; `build`/`clean`/`version` undefined.
  Near-identical shape to `genie` — worth confirming the two repos are meant
  to diverge from the template the same way, since they look like siblings.

### `kieranpotts/plans`

- [ ] No `Makefile`/`run/` — reasonable, docs-only template repo.
- [ ] No `CHANGELOG.md`. Otherwise matches the template: `CONTRIBUTING.md`,
  `docs/README.md`, `.agents/skills/README.md`, `.claude/skills` present.

### `kieranpotts/playbook`

- [ ] No `CONTRIBUTING.md`, `Makefile`/`run/`, or skills scaffolding.
  Content-only repo, likely fine.

### `kieranpotts/popos`

- [ ] No `.devcontainer/` — makes sense, this backs up host OS config and
  isn't itself developed inside a container.
- [ ] No `CONTRIBUTING.md`, `CHANGELOG.md`, `docs/README.md`, or skills
  scaffolding.
- [ ] `Makefile` has an `install` target backed by `run/install`;
  `build`/`clean`/`lint`/`test`/`version` undefined either way.

### `kieranpotts/pre-commit-hooks`

- [ ] No `CONTRIBUTING.md`, `docs/README.md`, or skills scaffolding — notable
  for a repo whose whole purpose is being consumed by other repositories.
- [ ] `Makefile` has a `version` target backed by `run/version`;
  `build`/`clean`/`install`/`lint`/`test` undefined.

### `kieranpotts/resume`

- [ ] No `LICENSE.txt`, `CONTRIBUTING.md`, `docs/README.md`, or skills
  scaffolding.
- [ ] `Makefile` (`start`/`build`/`stop`/`version`) only `build` and
  `version` have matching `run/` scripts; `start`/`stop` are inlined —
  mirrors `asciibook`'s shape (both are Docker-based document builds).

### `kieranpotts/risks`

- [ ] No `Makefile`/`run/` — reasonable, docs-only template repo.
- [ ] No `CHANGELOG.md`. Otherwise matches the template: `CONTRIBUTING.md`,
  `docs/README.md`, `.agents/skills/README.md`, `.claude/skills` present.

### `kieranpotts/rfc`

- [ ] Same shape as `risks`/`plans`: no `Makefile`/`run/`, no `CHANGELOG.md`,
  everything else present and conformant.

### `kieranpotts/skills`

- [ ] No `.agents/skills/README.md` or `.claude/skills` — but this repo is
  the canonical *source* of skills (its own top-level `skills/` directory,
  built to `build/{claude,pi,cursor,copilot,agents}/`), not a consumer of
  the `.agents/skills/` convention, so this divergence looks correct rather
  than drift. Worth a one-line note in this repo's `AGENTS.md` clarifying
  that it's exempt from the usual skills convention, so future audits don't
  re-flag it.
- [ ] `Makefile` has an `install` target backed by `run/install`;
  `build`/`clean`/`lint`/`test`/`version` undefined (there's a `build/`
  output directory but no `Makefile build` target driving it — confirm
  how `build/` actually gets regenerated).

### `kieranpotts/specs`

- [ ] Same shape as `risks`/`plans`/`rfc`: no `Makefile`/`run/`, no
  `CHANGELOG.md`, everything else present and conformant.

### `kieranpotts/standards`

- [ ] `docs/` exists but has no `docs/README.md` index.
- [ ] No `Makefile`/`run/` or `CHANGELOG.md`. `CONTRIBUTING.md`,
  `.agents/skills/README.md`, `.claude/skills` all present.

### `kieranpotts/study`

- [ ] Same thin profile as `dictionary`/`interviews`/`papers`: no
  `LICENSE.txt`, `CONTRIBUTING.md`, `CHANGELOG.md`,
  `.pre-commit-config.yaml`, `Makefile`/`run/`, or skills scaffolding.

### `kieranpotts/the-timeless-way`

- [ ] `docs/` exists but has no `docs/README.md` index.
- [ ] No `LICENSE.txt`, `CONTRIBUTING.md`, `CHANGELOG.md`, or skills
  scaffolding.
- [ ] `Makefile` (`start`/`build`/`stop`) mirrors `asciibook`/`resume`; only
  `run/build` exists among `run/` scripts.

### `kieranpotts/thoughts`

- [ ] No `CONTRIBUTING.md`, `CHANGELOG.md`, `Makefile`/`run/`, or skills
  scaffolding. Content-only repo, likely fine.

### `kieranpotts/website`

- [ ] Best template conformance of any repo with a real build pipeline: has
  `CONTRIBUTING.md`, `CHANGELOG.md`, and a `Makefile` with `install`,
  `build`, `clean`, `lint`, `version` all correctly backed by matching
  `run/` scripts.
- [ ] `Makefile` defines several extra, project-specific targets
  (`watch`, `preview`, `serve`, `preview-ui`, `preview-ui-serve`,
  `lint-css`) beyond the template's vocabulary, and a `run/test` script
  doesn't exist even though `Makefile` presumably could define one — confirm
  there's genuinely no automated test suite, or add it.
- [ ] No `docs/README.md`, despite having a substantial `docs/` tree — worth
  adding an index.

### `kieranpotts/workspace`

- [ ] No `LICENSE.txt`, `CONTRIBUTING.md`, `CHANGELOG.md`, or skills
  scaffolding.
- [ ] `Makefile` has an `install` target with no matching `run/install`
  script (fully inlined) and no other `run/` scripts.

### `kieranpotts/zed`

- [ ] Second-thinnest repo checked, after `srcflow/*`: no `LICENSE.txt`,
  `CHANGELOG.md`, `Makefile`/`run/`, `.editorconfig`,
  `.pre-commit-config.yaml`, `.devcontainer/`, or `.vscode/`. Only
  `.zed/settings.json`, `README.md`, `AGENTS.md`/`CLAUDE.md`,
  `CONTRIBUTING.md`, and `docs/README.md` are present.
- [ ] `.agents/skills/` exists but has no `README.md` index, **and** there's
  no `.claude/skills` symlink pointing at it — the one repo in the whole
  portfolio where skills exist but Claude Code can't discover them at all.
  Worth fixing regardless of what else in this entry gets triaged.

### `srcflow/srcflow`

- [ ] Carries none of the personal-repo conventions: no `AGENTS.md`,
  `CLAUDE.md`, `CONTRIBUTING.md`, `SECURITY.md`, `LICENSE.txt`,
  `CHANGELOG.md`, `Makefile`/`run/`, `.editorconfig`,
  `.pre-commit-config.yaml`, `.devcontainer/`, `.vscode/`, `.zed/`, skills
  scaffolding, or `docs/README.md`. Only `README.md` exists.
- [ ] This is a separate GitHub org (`srcflow`, not `kieranpotts`) — decide
  explicitly whether it's meant to follow these conventions at all. If not,
  it shouldn't keep appearing in future drift audits; if so, it needs
  essentially the full template applied from scratch.

### `srcflow/sh`

- [ ] Same as `srcflow/srcflow` — only `README.md` exists, nothing else from
  the template. Same open decision about whether this org is in scope for
  these conventions.
