#!/usr/bin/env bash

PROJECTS=$(dirname "$0")/../..

go get -x github.com/sagernet/sing-box@$(git -C $PROJECTS/sing-box rev-parse HEAD)
go mod tidy
