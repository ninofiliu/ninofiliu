#!/bin/sh -e
date=$1
commit=$(git-when $date)
git reset --hard $commit
