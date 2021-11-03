#!/bin/sh

HEAD_BRANCH=$(git remote show origin | awk '/HEAD branch/ {print $NF}')
git branch --merged $HEAD_BRANCH | grep -v $HEAD_BRANCH | xargs git branch -d
