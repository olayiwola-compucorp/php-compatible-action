#!/bin/sh

cp /problem-matcher.json /github/workflow/problem-matcher.json

echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/problem-matcher.json"

phpcs -p . --standard=PHPCompatibility --extensions=php --runtime-set testVersion php7.4

status=$?

echo "::remove-matcher owner=phpcs::"

exit $status