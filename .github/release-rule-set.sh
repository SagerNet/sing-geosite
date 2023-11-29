#!/bin/bash

set -e -o pipefail

cd rule-set
git init
git config --local user.email "github-action@users.noreply.github.com"
git config --local user.name "GitHub Action"
git remote add origin https://github-action:$GITHUB_TOKEN@github.com/SagerNet/sing-geosite.git
git branch -M rule-set
git add .
git commit -m "Update rule-set"
git push -f origin rule-set
