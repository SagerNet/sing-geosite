#!/bin/bash

set -e -o pipefail

mkdir -p release
cd release
git init
git config --local user.email "github-action@users.noreply.github.com"
git config --local user.name "GitHub Action"
git remote add origin https://github-action:$GITHUB_TOKEN@github.com/SagerNet/sing-geosite.git
git branch -M release
cp ../*.db ../*.sha256sum .
git add .
git commit -m "Update release"
git push -f origin release
