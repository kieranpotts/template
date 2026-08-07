# Committing

The commit log is a first-class artifact of this project. It outlives issues,
tickets, and decision logs, and it is the source-of-truth for understanding how
the codebase got to where it is. Commit deliberately, with the same care given
to the code itself.

These conventions follow
[TS-9: Version Control](https://raw.githubusercontent.com/kieranpotts/standards/refs/heads/latest/dev/src/009/AGENTS.md).
They are enforced automatically — see [Validation](#validation) below.

## Atomic commits

Every commit MUST be atomic: small, stable, and self-contained.

- **Small.** One minimal coherent idea per commit. Prefer many small commits to
  a few large ones — granular commits can be squashed later, but a monolithic
  commit cannot easily be split.

- **Stable.** The build compiles and the tests pass at every commit. The golden
  rule is: don't break the build. A commit that does break it MUST carry the
  `WIP` flag and MUST NOT reach a trunk.

- **Self-contained.** The commit can be reverted on its own, without unwinding
  earlier commits. Code and the tests that verify it belong in the same commit;
  splitting them produces two commits that depend on each other.

Scope each commit to a single concern where you can — schema changes apart
from application code, back end apart from front end. Where that conflicts
with keeping the build stable, stability wins: prefer the larger commit.

Stage changes deliberately. Avoid `git add -A` and `git commit -a` for routine
work; they assume every local change belongs in the next commit, which is how
unrelated edits, debug output, and build artifacts get bundled in. Use
`git add <path>`, or `git add -p` to stage individual hunks.

Do not combine a file rename with substantial edits to that file in one commit.
Git detects renames from content similarity, so mixing the two can turn the
diff into a delete-plus-add and break `git log --follow`. Commit the rename,
then commit the edits.

> [!TIP]
> When the need for a refactor surfaces midway through a change, do not fold
> it into the commit you are already building. Run `git stash`, commit the
> refactor on its own, then `git stash pop` and carry on.

## Revision types

Each commit MUST be scoped to exactly one of the following eleven revision
types, which is written as the prefix of the commit message header.

| Type          | Covers                                                            |
| ------------- | ----------------------------------------------------------------- |
| `feature`     | A new, changed, deprecated, or removed user-facing behavior.       |
| `runtime`     | A change to a dynamic quality attribute — latency, throughput, availability, security, resilience — observable outside the system. |
| `fix`         | Resolution of a defect: bug, regression, vulnerability, incident.  |
| `step`        | An increment toward a larger change, not user-facing on its own.   |
| `refactor`    | An improvement to internal design or structure, behavior unchanged. |
| `style`       | Presentation-only changes: whitespace, wrapping, formatter runs.   |
| `maintenance` | Upkeep: dependency updates, CI config, test and docs improvements. |
| `chore`       | Small housekeeping, not worth tracking in the issue tracker.       |
| `release`     | Preparation of a new numbered release.                             |
| `merge`       | An explicit merge commit.                                          |
| `revert`      | Reverting an earlier commit.                                       |

Two distinctions are easy to get wrong:

- **`runtime` vs. `refactor`.** Runtime revisions improve *external*, *dynamic*
  qualities that users can observe or measure. Refactors improve *internal*,
  *static* qualities that only developers see. Performance work is one kind of
  runtime revision, not the whole of it.

- **`style` vs. `refactor`.** A style commit changes only how the code looks.
  A refactor changes how it is structured. Keeping bulk reformatting in its own
  type makes it easy to skip over when reading history or running `git bisect`.

Commit types do not have to map one-to-one onto issue types. A `refactor` may
well be associated with a feature issue, if the refactor was needed to
implement the feature.

> [!NOTE]
> Repositories holding non-executable content — documentation, specs,
> handbooks — SHOULD instead use the alternative set defined in TS-9: `add`,
> `edit`, `fix`, `remove`, `restructure`, `style`, `chore`, `release`, `merge`,
> `revert`. Pick one set per repository and configure the validation hooks to
> match; do not mix the two.

## Commit message format

A commit message consists of a header, an optional body, and optional footers.
Each block is separated by a single empty line.

```txt
<type>: <description> - <flag>

[<body>]

[<footers>]
```

Write commit messages in American English, using US-ASCII characters only.

### Header

The header — the subject line — is the only required part. It is the type
and a description, separated by a colon and exactly one space.

- Write the description in lowercase, with no terminating period.
- Use the imperative mood, present tense: "remove", not "removed" or "removes".
  The description should complete the sentence *"If applied, this commit will
  …"*.
- Start with a verb describing the action taken. Two exceptions: a `fix` need
  only name the problem being fixed, and a `release` need only give the version
  number.
- Keep the whole header — type, description, and flag — under 50 characters
  where possible. It MUST NOT exceed 72. Only automated `merge` and `revert`
  headers are exempt.
- Do not put issue numbers in the header. They belong in the footers.

The point of these rules is that `git log --oneline` reads as a coherent
high-level narrative of the project:

```txt
chore: initial commit, add readme
step: add openapi specification
fix: invalid yaml formatting
refactor: move openapi spec to resources directory
feature: enable route to openapi spec
release: v0.0.0-beta
```

### Flags

The header MAY end with a single flag, demarcated from the description by a
spaced hyphen and written in full capitals.

| Flag         | Meaning                                                        |
| ------------ | -------------------------------------------------------------- |
| `BREAKING`   | A change incompatible with existing external clients of an API or interface. Anything that must be communicated to users via release notes MUST carry this flag. |
| `INCOMPAT`   | An *internal* breaking change — a changed function signature, data structure, or schema that requires callers to be updated. |
| `WIP`        | Work-in-progress that breaks the build.                        |
| `EXPERIMENT` | An experimental change that may be rolled back.                |
| `TEMPORARY`  | A change that will definitely be reverted, such as debug output. |

```txt
feature: remove password from login endpoint - BREAKING
step: remove third param of login action - INCOMPAT
maintenance: add more logging - TEMPORARY
```

Where a commit is flagged `BREAKING` or `INCOMPAT`, use the body to explain the
change, why the interface had to break, and what the consequences are.

`WIP` commits are permitted only on temporary and epic branches. They MUST be
cleaned up — rebased, squashed, or amended — before the work is integrated,
and MUST NOT reach `dev`, `test`, or `ready`.

### Body

The body is optional. Where the header records *what* changed, the body records
*why*: the motivation, the background context, the approaches that were
considered and rejected, and anything a future maintainer would want to know
that cannot be read off the diff. Recording what the change deliberately does
*not* do is often as valuable as recording what it does.

Do not restate what the commit object already carries. There is no reason to
list the files that changed.

Write full sentences terminated by periods, in paragraphs separated by blank
lines. Markdown-style bullet lists are welcome, with hanging indents for
wrapped lines. Keep lines to 72 characters.

```txt
fix: prevent racing of requests

Introduce a request id and a reference to the latest request. Dismiss
incoming responses other than from latest request.

Remove timeouts which were previously used to mitigate the racing
issue but which are now obsolete.

Refs: #123
```

> [!TIP]
> Multi-line messages are awkward to write inline. Omit `--message|-m` and let
> Git open your editor instead.

### Footers

Footers are a block of key-value pairs, separated from what precedes them by a
single blank line, one pair per line, in the form `<key>: <value>`. Keys are
case-insensitive; by convention only the first word is capitalized. Keys need
not be unique — repeat a key to record several values.

Cross-reference the issues and pull requests relevant to the change. Use
`Closes` to have the referenced issue closed automatically when the commit
lands on the default branch, or `Refs` to reference it without closing it.

```txt
Closes: #123
Closes: #456
```

Repeat `Closes` once per issue. Auto-close parsers generally match one issue
reference per keyword, so `Closes: #123, #456` typically closes only the first.

Other useful footers include `Reviewed-by`, `Tested-by`, `Co-authored-by`, and
`Signed-off-by` — the last of which Git will add for you, from your
configured `user.name` and `user.email`, if you pass `--signoff|-s` to
`git commit`.

### Merge and revert commits

Fast-forward-only integration is preferred, which avoids merge commits
altogether. Where an explicit merge commit is necessary, edit the header to
name the kind of work being integrated — `feature:`, `refactor:`, `runtime:`
— rather than the generic `merge:`, and keep the body Git generates, which
records the hashes of the integrated commits.

A revert quotes the header of the commit being reverted, and carries a single
`Reverts` footer naming its SHA:

```txt
revert: "refactor: move location of overlay component"

Reverts: d7o8k8l
```

## Rewriting history

Do not rewrite history that has been pushed to a shared branch.

- **Trunks** (`dev`, `test`, `ready`, release branches) — history MUST NOT be
  rewritten under any circumstances. Fix forward.
- **Temporary branches** (`temp/*`) — owned by one developer, so rewriting is
  safe. Tidying the branch into a clean series of atomic commits before
  integration is RECOMMENDED.
- **Epic branches** (`epic/*`) — shared, so any rewrite MUST be coordinated
  with everyone working on the branch.

## Validation

Commit messages are validated in two places:

- Locally, by the `validate-commit-message` pre-commit hook, at the moment you
  commit. See [pre-commit hooks](./pre-commit-hooks.md) for installation.
- In CI, by the `validate-commit-messages` workflow, which checks every commit
  added by a push, on every branch.

Both check the header against the `<type>: <description>` format and the list
of permitted revision types. Neither checks the body, the footers, the line
lengths, or the mood of the description — those remain a matter of discipline
and code review.

## Commit message template

Configuring a local commit message template makes these conventions easier to
follow when `git commit` opens your editor:

```sh
git config commit.template .gitmessage
```

TS-9 includes a ready-made template, listing the revision types and flags as
editor comments, to save you from remembering them.
