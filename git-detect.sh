#!/usr/bin/env bash

# display files affected
echo "changes on files $(git ls-files -m)"

# save names files in var NAME_FILES
NAME_FILES=$(git status --porcelain|tr '\n' ' ')

# add all files affected
git add .

# commit with all files with each name affected
git commit -m "your files affected: ${NAME_FILES}"

# message ready to push
echo "your files are commited, ready to push...!"
