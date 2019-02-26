#!/usr/bin/env bash

#########################
# The command line help #
#########################
display_help() {
    echo "Usage: $0 [option...] {new_branch|add|commit}" >&2
    echo
    echo "   commit            You must put a comment or description"
    echo
    echo "   push              Push your branch to origin"
    echo
    echo "   new_branch        Function to create a new branch and start to work on it"
    echo
    # echo some stuff here for the -a or --add-options
    exit 1
}

create_new_branch() {
    echo "Function to create a new branch on github"
    git checkout -b nginx-conf-branch
    exit 0
}

commit() {
    echo "Function to add your changes to your branch"
    git add * && git commit -a
    exit 0
}

push() {
    echo "Function to push your changes to origin and return to master branch"
    git push origin nginx-conf-branch && git checkout master
    exit 0
}

reload() {
    echo "Function to update the nginx conf and reload the service"
    git pull && nginx -t && service nginx reload
    exit 0
}

case "$1" in
    new_branch)
        create_new_branch
        exit 1
        ;;
    -h | --help)
        display_help
        exit 1
        ;;
    push)
        push
        exit 1
        ;;
    commit)
        commit
        exit 1
        ;;
    reload)
        reload
        exit 1
        ;;
esac
