#!/bin/bash
dir=$(pwd)
cd $dir
filelist=$(ls *.eps)
green=$'\e[1;32m'
red=$'\e[0;31m'
blue=$'\e[0;34m'
lcyan=$'\e[1;36m'
yellow=$'\e[1;33m'

if [ ! $2 ] && [ ! $3 ]
    then
        background=white;
        percent=10;
        echo "$green Default background is white"
        echo "$green Default fuzz %10"
    else
        background=$2;
        percent=$3;
        echo "$green background is $background"
        echo "$green fuzz is %$percent"
fi

for file in $filelist
do
    if [[ "$file" =~  .*"$1".* ]]; then
        convert $file -fuzz %$percent -transparent $background "${file%.*}-out.pdf"
        echo "$green $file ---> ${file%.*}-out.pdf"
    fi
done


