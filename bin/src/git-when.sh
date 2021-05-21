#!/bin/sh -e
date=$1
git log --until=$date --max-count=1 --format=%h
