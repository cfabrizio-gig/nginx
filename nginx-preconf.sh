#!/bin/bash

git checkout -b $1

git add *

git commit -m "$2"

git push origin $1

git branch -a

git checkout master
