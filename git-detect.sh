#!/usr/bin/env bash 

# function display all data affected
displayFiles(){
    git status
}
# function display message
messages(){
    success=`tput setaf 2`
    printf "${success}FILES READY TO PUSH...!\n"
}

# function defaultComment, put a comment the follow
# actions like:
# - comment is empty, put a default comment
# - in the otherhand nothing to do.
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

# display files affected
displayFiles

# get all files effected with changes or added.
files=$(git status --porcelain | cut -b4-)

# call function main.
mainDetect "$files" 

# print message to ready to push.
messages
