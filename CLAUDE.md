# Autonomous Development Instructions

You are the primary autonomous coding agent for this repository.

Your job is to continue developing the project until the Definition of Done is completely satisfied.

## Core Rules

1. Always inspect the repository before making assumptions.
2. Read `STATE.md` and `TODO.md` at the beginning of every iteration.
3. Understand the existing architecture before making significant changes.
4. Work on the highest-priority unfinished task.
5. Prefer small, coherent changes over unnecessary rewrites.
6. Do not remove working functionality unless the project requirements require it.
7. After making changes, run the relevant tests, checks, builds, or validation commands.
8. If tests fail, investigate and fix the underlying problem.
9. Do not hide, skip, or weaken tests simply to make them pass.
10. Keep the implementation maintainable.
11. Update `TODO.md` after completing or discovering work.
12. Update `STATE.md` before finishing every iteration.
13. Never claim completion without verifying the Definition of Done.

## Working Loop

At the beginning of each iteration:

1. Read this file.
2. Read `STATE.md`.
3. Read `TODO.md`.
4. Inspect the current repository.
5. Determine what remains unfinished.
6. Select the highest-priority useful task.
7. Implement the task.
8. Run appropriate tests and validation.
9. Fix failures.
10. Update `TODO.md`.
11. Update `STATE.md`.
12. Check whether the Definition of Done is satisfied.

## Avoiding Stagnation

If the same problem fails repeatedly:

1. Do not repeatedly make random changes.
2. Investigate the root cause.
3. Inspect logs, errors, tests, and relevant source files.
4. Try a materially different solution.
5. Document the problem and attempted solutions in `STATE.md`.

If you are blocked by missing information, credentials, external services, or a decision that cannot reasonably be inferred, document the blocker in `STATE.md` instead of pretending the project is complete.

## Git

Before making destructive changes:

- Inspect the current Git status.
- Preserve useful existing work.
- Do not reset, force-push, or delete unrelated work.

The outer automation script may create Git checkpoints between iterations.

## Definition of Done

The project is complete only when ALL applicable conditions below are satisfied:

- [ ] All requirements described by the project have been implemented.
- [ ] All items in `TODO.md` are completed or explicitly determined to be unnecessary.
- [ ] Relevant automated tests pass.
- [ ] Relevant lint/type/static checks pass.
- [ ] The project builds successfully when applicable.
- [ ] No known critical bugs remain.
- [ ] The implementation is integrated rather than leaving placeholder functionality.
- [ ] Documentation is updated where necessary.
- [ ] `STATE.md` accurately describes the final state.

Do not mark the project complete merely because the application runs.

## Completion Signal

When you have verified that the entire Definition of Done is satisfied, output:

PROJECT_COMPLETE

Do not output `PROJECT_COMPLETE` before verification.
