#!/usr/bin/env bash

set -eu

echo "********************"
echo "* install gems     *"
echo "********************"
gem install --no-document checkstyle_filter-git saddler saddler-reporter-github pmd_translate_checkstyle_format

echo "********************"
echo "* exec check       *"
echo "********************"
vendor/bin/phpcs app --report=checkstyle --report-file=phpcs.result.xml --standard=phpcs.ruleset.xml
vendor/bin/phpmd app xml phpmd.ruleset.xml --reportfile phpmd.result.xml

echo "********************"
echo "* save outputs     *"
echo "********************"

LINT_RESULT_DIR="$CIRCLE_ARTIFACTS/lint"

mkdir "$LINT_RESULT_DIR"
cp -v "phpcs.result.xml" "$LINT_RESULT_DIR/"
cp -v "phpmd.result.xml" "$LINT_RESULT_DIR/"

echo "********************"
echo "* select reporter  *"
echo "********************"

if [ -z "${CI_PULL_REQUEST}" ]; then
    # when not pull request
    REPORTER=Saddler::Reporter::Github::CommitReviewComment
else
    REPORTER=Saddler::Reporter::Github::PullRequestReviewComment
fi

echo "********************"
echo "* checkstyle       *"
echo "********************"
cat phpcs.result.xml \
    | checkstyle_filter-git diff origin/master \
    | saddler report --require saddler/reporter/github --reporter $REPORTER

echo "********************"
echo "* PMD              *"
echo "********************"
cat phpmd.result.xml \
    | pmd_translate_checkstyle_format translate \
    | checkstyle_filter-git diff origin/master \
    | saddler report --require saddler/reporter/github --reporter $REPORTER
