# !/bin/bash

function install_my_favorite() {
    IFS=$'\n'
    echo "about to install packages contained in $1"
    for APP in $(sed 's/ *#.*$//' $1)
    do
        if which ${APP} > /dev/null 2>&1; then
            echo "     ${APP} already installed !"
        else
            echo "     installing ${APP}"
            eval "apt-get install ${APP}"
        fi
    done
}

install_my_favorite("list_of_apps.txt")


