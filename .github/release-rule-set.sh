#!/bin/bash

set -e -o pipefail

function releaseRuleSet() {
    dirName=$1
    pushd $dirName
    git init
    git config --local user.email "github-action@users.noreply.github.com"
    git config --local user.name "GitHub Action"
    git remote add origin https://github-action:$GITHUB_TOKEN@github.com/SagerNet/sing-geosite.git
    git branch -M $dirName
    git add .
    git commit -m "Update rule-set"
    git push -f origin $dirName
    popd
}

releaseRuleSet rule-set
releaseRuleSet rule-set-unstable
