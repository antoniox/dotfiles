fgrepcode() {
    find . -name \*$2 -print0 | xargs -0 fgrep "$1" --color -iH
}

git_squash_editor() {
    if [ $(basename $1) = "git-rebase-todo" ]; then
        sed -i '2,$ s/^pick/squash/' $1;
    else
        vim $1;
    fi
}
