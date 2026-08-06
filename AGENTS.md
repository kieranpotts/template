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

- **[.agents/skills/](./.agents/skills/)** \
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

- The root [README](./README.md) is for *users* of the project: requirements,
  installation, and usage. Material for developers and maintainers MUST NOT be
  added to it. That belongs in [CONTRIBUTING.md](./CONTRIBUTING.md), which
  indexes the pages in [docs/](./docs/).

- The README's second-level headings are prefixed with an emoji, drawn from
  this fixed vocabulary. Do not invent new ones, and do not use emoji in
  headings anywhere else:

  | Emoji | Heading                 |
  | ----- | ----------------------- |
  | ☑️     | Requirements            |
  | 📦    | Installation            |
  | 🧭    | Usage                   |
  | 📖    | User manual             |
  | 📓    | Developer documentation |

- MUST NOT do this.

- SHOULD do this.

- MAY do this.

## Skills

The **[.agents/skills/](./.agents/skills/)** directory provides on-demand skills
for managing this repository. See the [README](./.agents/skills/README.md) in
that directory for descriptions of the available skills and the situations
when you should use them.

`.claude/skills` is a symlink to that directory, since Claude Code discovers
skills only under `.claude/`. It is not a second copy, and skills MUST NOT be
added to it directly. The README covers the reasoning and how to recreate the
link.

## References

The following technical standards (TS) govern this project. Read the relevant
standard(s) for the current task.

- **[TS-1: Software Requirements Specification](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/001/AGENTS.md)**
- **[TS-2: Software Design Qualities](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/002/AGENTS.md)**
- **[TS-3: Design Docs](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/003/AGENTS.md)**
- **[TS-4: Modeling](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/004/AGENTS.md)**
- **[TS-5: Application Architecture](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/005/AGENTS.md)**
- **[TS-6: Distributed System Design](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/006/AGENTS.md)**
- **[TS-7: Code Design](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/007/AGENTS.md)**
- **[TS-8: Issue Tracking](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/008/AGENTS.md)**
- **[TS-9: Version Control](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/009/AGENTS.md)**
- **[TS-10: Releasing](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/010/AGENTS.md)**
- **[TS-11: Versioning](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/011/AGENTS.md)**
- **[TS-12: Quality Assurance](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/012/AGENTS.md)**
- **[TS-13: Functional Testing](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/013/AGENTS.md)**
- **[TS-14: Performance Testing](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/014/AGENTS.md)**
- **[TS-15: User Interfaces](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/015/AGENTS.md)**
- **[TS-16: Command Line Interfaces (CLIs)](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/016/AGENTS.md)**
- **[TS-17: Graphical User Interfaces (GUIs)](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/017/AGENTS.md)**
- **[TS-18: Web GUIs](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/018/AGENTS.md)**
- **[TS-19: Search Engine Optimization (SEO)](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/019/AGENTS.md)**
- **[TS-20: Network APIs](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/020/AGENTS.md)**
- **[TS-21: HTTP APIs](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/021/AGENTS.md)**
- **[TS-22: Webhooks](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/022/AGENTS.md)**
- **[TS-23: Messages and Events](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/023/AGENTS.md)**
- **[TS-24: User Manuals](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/024/AGENTS.md)**
- **[TS-25: Technical Documentation](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/025/AGENTS.md)**
- **[TS-26: Technical Writing Style Guide](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/026/AGENTS.md)**
- **[TS-27: Markdown](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/027/AGENTS.md)**
- **[TS-28: AsciiDoc](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/028/AGENTS.md)**
- **[TS-29: JSON Schema](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/029/AGENTS.md)**
- **[TS-30: YAML](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/030/AGENTS.md)**
- **[TS-31: Unix Shells and POSIX Standards](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/031/AGENTS.md)**
- **[TS-32: Bash](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/032/AGENTS.md)**
- **[TS-33: Java](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/033/AGENTS.md)**
- **[TS-34: PHP](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/034/AGENTS.md)**
- **[TS-35: Python](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/035/AGENTS.md)**
- **[TS-36: ECMAScript (JavaScript/TypeScript)](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/036/AGENTS.md)**
- **[TS-37: Web Platform APIs](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/037/AGENTS.md)**
- **[TS-38: Node.js Applications](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/038/AGENTS.md)**
- **[TS-39: HTML](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/039/AGENTS.md)**
- **[TS-40: CSS](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/040/AGENTS.md)**
- **[TS-41: React](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/041/AGENTS.md)**
- **[TS-42: Vue](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/042/AGENTS.md)**
- **[TS-43: Relational Databases and SQL](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/043/AGENTS.md)**
- **[TS-44: Non-Relational (NoSQL) Databases](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/044/AGENTS.md)**
- **[TS-45: Data Migrations](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/045/AGENTS.md)**
- **[TS-46: Distributed Data and Caching](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/046/AGENTS.md)**
- **[TS-47: Dates and Times](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/047/AGENTS.md)**
- **[TS-48: Environment Variables](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/048/AGENTS.md)**
- **[TS-49: Cloud Platform Engineering](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/049/AGENTS.md)**
- **[TS-50: Cloud Economics](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/050/AGENTS.md)**
- **[TS-51: Amazon Web Services (AWS)](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/051/AGENTS.md)**
- **[TS-52: Security and Secrets Management](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/052/AGENTS.md)**
- **[TS-53: Privacy and Data Protection](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/053/AGENTS.md)**
- **[TS-54: Threat Modeling](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/054/AGENTS.md)**
- **[TS-55: Authentication and Authorization](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/055/AGENTS.md)**
- **[TS-56: JSON Web Tokens (JWTs)](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/056/AGENTS.md)**
- **[TS-57: Logging, Monitoring, Observability](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/057/AGENTS.md)**
- **[TS-58: Docker](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/058/AGENTS.md)**
- **[TS-59: Terraform](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/059/AGENTS.md)**
- **[TS-60: GitHub Actions](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/060/AGENTS.md)**
- **[TS-61: AI Tools](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/061/AGENTS.md)**
- **[TS-62: Make](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/062/AGENTS.md)**
- **[TS-63: URL Design](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/063/AGENTS.md)**
