# AGENTS.md

## Project overview

A short paragraph describing what this project does, who it is for, and any constraints that materially affect how AI agents should approach changes to it.

## Tech stack

- Language and runtime versions.
- Major frameworks and libraries.
- Commands for building, testing, and linting.

## Skills

Skills, which specify standards and playbooks, may be defined inside and outside the repository. Local skills files (whether in the same repository or another checked-out in a multi-repo workspace) should have paths relative to the `AGENTS.md` file. Remote skills files should have fully-qualified URLs.

- `./skills/release.md` — checklist for cutting a release.
- `./skills/migration.md` — guidance for writing database migrations.
- `../skills/code-review.md` — generic code review checklist.
- `https://example.com/standards/api-design` — API design conventions.

## House rules

- Never commit secrets or generated build artifacts.
- Prefer editing existing files to creating new ones.
- Ask before introducing a new top-level dependency.
