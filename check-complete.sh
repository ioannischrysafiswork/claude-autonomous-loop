#!/usr/bin/env bash

set -u

echo "Running completion checks..."

# 1. Check for unfinished TODO items
if grep -R -nE '^[[:space:]]*-[[:space:]]*\[[[:space:]]\]' \
    TODO.md \
    --exclude-dir=.git \
    --exclude-dir=node_modules \
    2>/dev/null; then

    echo ""
    echo "Completion check failed:"
    echo "There are unfinished TODO items."
    exit 1
fi

# 2. Check STATE.md
if grep -q "PROJECT_COMPLETE" STATE.md; then
    echo "STATE.md reports completion."
else
    echo ""
    echo "Completion check failed:"
    echo "STATE.md does not report PROJECT_COMPLETE."
    exit 1
fi

# 3. Basic project-specific test detection
if [ -f "package.json" ]; then
    echo "Node project detected."

    if command -v npm >/dev/null 2>&1; then
        npm test
        TEST_RESULT=$?

        if [ $TEST_RESULT -ne 0 ]; then
            echo "Tests failed."
            exit 1
        fi
    fi
fi

if [ -f "pyproject.toml" ] || [ -f "pytest.ini" ] || [ -d "tests" ]; then
    echo "Python project detected."

    if command -v pytest >/dev/null 2>&1; then
        pytest
        TEST_RESULT=$?

        if [ $TEST_RESULT -ne 0 ]; then
            echo "Tests failed."
            exit 1
        fi
    fi
fi

echo ""
echo "======================================"
echo "ALL COMPLETION CHECKS PASSED"
echo "======================================"

exit 0
