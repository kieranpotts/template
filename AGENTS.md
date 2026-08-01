# [Project Name]

A short paragraph describing what this project does, who it is for, and any
constraints that materially affect how AI agents should approach changes to it.

The capitalized words REQUIRED, MUST, MUST NOT, RECOMMENDED, SHOULD,
SHOULD NOT, OPTIONAL, and MAY are to be interpreted as described in
[IETF RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).

## Tech stack

- Language and runtime versions.
- Major frameworks and libraries.

## Project structure

- **[src/](./src/)** \
  Application source.

- **[tests/](./tests/)** \
  Automated tests (unit, integration, system).

- **[run/](./run)** \
  Dev tools (Bash scripts).

- **[docs/](./docs/)** \
  Developer/maintainer docs, including architectural decision records.

- **[skills/](./skills)** \
  On-demand context for agents.

## Documentation

- **Architecture audit reports** \
  [docs/audits/](./docs/audits/) (mono-repo) | <https://github.com/kieranpotts/audits> (multi-repo)

- **Design docs** \
  [docs/design/](./docs/design/) (mono-repo) | <https://github.com/kieranpotts/design> (multi-repo)

- **Delivery plans** \
  [docs/plans/](./docs/plans/) (mono-repo) | <https://github.com/kieranpotts/plans> (multi-repo)

- **Requests for Comments (RFCs)** \
  Includes key design decisions (KDDs) and architecture decision records (ADRs). \
  [docs/rfc/](./docs/rfc/) (mono-repo) | <https://github.com/kieranpotts/rfc> (multi-repo)

- **Risk register** \
  [docs/risks/](./docs/risks/) (mono-repo) | <https://github.com/kieranpotts/risks> (multi-repo)

- **Software requirements specification (SRS)** \
  [docs/specs/](./docs/specs/) (mono-repo) | <https://github.com/kieranpotts/specs> (multi-repo)

## Team

- **[Name] — Project Lead** \
  Owns overall direction, priorities, and scope trade-offs. Final
  decision-maker when requirements conflict.

- **[Name] — Tech Lead / Architect** \
  Owns architecture decisions, design docs, and RFCs.
  Reviews significant structural changes.

- **[Name] — Security Lead** \
  Runs threat modeling sessions, owns the risk register,
  and reviews changes to authentication, authorization, and data handling.

- **[Name] — QA / Test Lead** \
  Owns test strategy and the automated test suite. Signs off on
  acceptance testing before release.

- **[Name] — Release Manager** \
  Owns the release process and versioning. Decides when a release branch is
  cut and what ships in it.

- **[Name] — Documentation Owner** \
  Maintains developer and maintainer docs, including keeping
  architectural decision records up to date.

- **[Name] — Product Owner** \
  Owns the requirements specification and prioritizes the
  backlog. First point of contact for scope questions.

## Tools

- **`command`** \
  Build production-grade artifacts.

- **`command`** \
  Runs the linter.

- **`command`** \
  Runs the automated test suite.

## Rules

- MUST NOT do this.

- SHOULD do this.

- MAY do this.

## Skills

The **[.agents/skills/](./.agents/skills/)** directory provides on-demand skills
for managing this repository. See the [README](./.agents/skills/README.md) in
that directory for descriptions of the available skills and the situations
when you should use them.
