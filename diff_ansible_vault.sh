#!/bin/bash

FILE=$1
BRANCH=${2:-master}

usage() {
    echo "Usage: $0 filename <branch>"
    echo "If branch is omitted, master is used."
}

if [ -z $FILE ]; then
    usage

    printf "\nYou need to specify the file\n"
    exit 1
fi

if [ ! -f $FILE ]; then
    usage

    printf "\nFile: $FILE does not exists\n"
    exit 1
fi

diff <(git show $BRANCH:$FILE | ansible-vault view -) <(ansible-vault view $FILE)