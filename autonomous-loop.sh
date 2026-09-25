#!/usr/bin/env bash

set -u

MAX_ITERATIONS=100

echo "======================================"
echo " Autonomous Claude Code Agent"
echo "======================================"
echo ""

for ((i=1; i<=MAX_ITERATIONS; i++)); do

    echo ""
    echo "======================================"
    echo " Claude Code iteration $i / $MAX_ITERATIONS"
    echo "======================================"
    echo ""

    if [ -d ".git" ]; then
        echo "Git repository detected."
    else
        echo "WARNING: This directory is not a Git repository."
        echo "Consider running: git init"
    fi

    claude -p "
You are operating as an autonomous development agent.

Continue developing the current repository.

Before doing anything:

1. Read CLAUDE.md.
2. Read STATE.md.
3. Read TODO.md.
4. Inspect the current repository and its existing implementation.

Then:

1. Determine the highest-priority unfinished task.
2. Implement that task.
3. Run the appropriate tests/checks.
4. Fix any failures you encounter.
5. Do not weaken or remove tests simply to make them pass.
6. Update TODO.md.
7. Update STATE.md with:
   - what you completed
   - what remains
   - any problems encountered
   - what the next iteration should do

Continue working until this iteration has made meaningful progress.

IMPORTANT:

Do not claim the project is complete unless you have actually verified
the Definition of Done in CLAUDE.md.

If the entire project is genuinely complete, output exactly:

PROJECT_COMPLETE
"

    CLAUDE_EXIT=$?

    echo ""
    echo "Claude Code exit code: $CLAUDE_EXIT"

    echo ""
    echo "Running completion verification..."

    if ./check-complete.sh; then

        echo ""
        echo "======================================"
        echo " PROJECT COMPLETE"
        echo "======================================"
        echo ""
        echo "Completed after $i iteration(s)."

        if [ -d ".git" ]; then
            git add .
            git commit -m "Complete autonomous development" || true
        fi

        exit 0
    fi

    echo ""
    echo "Project is not complete."

    if [ -d ".git" ]; then
        echo "Creating Git checkpoint..."
        git add .
        git commit -m "Autonomous development iteration $i" || true
    fi

    echo ""
    echo "Starting next iteration..."
    echo ""

    sleep 2

done

echo ""
echo "======================================"
echo " MAXIMUM ITERATIONS REACHED"
echo "======================================"
echo ""
echo "The project was not verified as complete."
echo "Review STATE.md and TODO.md."

exit 1
