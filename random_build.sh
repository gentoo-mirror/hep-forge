#!/bin/bash
D=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $D
git pull
A=($(find . -name "*.ebuild"))
echo "random_build" >> $(dirname ${A[$(($RANDOM % ${#A[@]}))]})/.build
git add .
git commit -am "random_build"
git push


