#!/usr/bin/env bash

# test coverage threshold
COVERAGE_THRESHOLD=0

check_python_version() {
    python3 /tools/check_python_version.py 3 6
}

locale charmap

check_python_version

export RADONFILESENCODING=UTF-8

echo "*****************************************"
echo "*** Cyclomatic complexity measurement ***"
echo "*****************************************"
radon cc -s -a -i usr .

echo "*****************************************"
echo "*** Maintainability Index measurement ***"
echo "*****************************************"
radon mi -s -i usr .

echo "*****************************************"
echo "*** Unit tests ***"
echo "*****************************************"

pytest --cov=/insights_engine/ --cov-report term-missing --cov-fail-under=$COVERAGE_THRESHOLD -vv /tests/unit_tests/
