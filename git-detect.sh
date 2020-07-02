#!/usr/bin/env bash 

# show message
messages(){
    success=`tput setaf 2`
    printf "${success}FILES READY TO PUSH...!\n"
}

# comment is empty, put a default comment
# in the otherhand nothing to do.
defaultComment(){
    if [ -z "${comments}" ]
    then
        echo "there are comments default"
        git commit -m "${file}"
    fi
}

# function main. 
mainDetect(){
    for file in $files; do
        echo $file
        git add $file
        read -p "enter a comment: " comments
        defaultComment "$comments"
        git commit -m "${comments}"
        echo ""
    done
}

# get all files effected with changes or added.
files=$(git status --porcelain | cut -b4-)

# call function main.
mainDetect "$files" 

# print message to ready to push.
messages
