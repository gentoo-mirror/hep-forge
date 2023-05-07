#!/bin/bash
D=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $D
git pull
A=($(find . -name ".build"))
echo "random_build" >> ${A[$(($RANDOM % ${#A[@]}))]}
echo "random_build" >> ${A[$(($RANDOM % ${#A[@]}))]}
git commit -am "random_build"
git push


