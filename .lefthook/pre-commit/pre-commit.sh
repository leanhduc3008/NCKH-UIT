#!/bin/zsh
echo "Checking your branch name"
LC_ALL=C

local_branch="$(git rev-parse --abbrev-ref HEAD)"

valid_branch_regex='^(feature|bugfix|improvement|release|hotfix)\/(Task|Bug|Doc)_[0-9]+.*$'

message="$local_branch is bad branch name. See example: feature/Task_2_some_text"

if [[ $local_branch == "master" || $local_branch == "develop" ]]
then
   exit 0
fi

if [[ ! $local_branch =~ $valid_branch_regex ]]
then
    echo "$message"
    exit 1
fi

exit 0