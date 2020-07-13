# !/bin/bash

function install_my_favorite() {
    IFS=$'\n'
    echo "about to install packages contained in $1"
    apt-get update
    for APP in $(sed 's/ *#.*$//' $1)
    do
        # echo "APP Line: ${APP}"
        # INFO[0] = App name; INFO[1] = App ppa
        IFS='|'; read -a INFO <<< "${APP}"
        if [ "${INFO[1]}" ]; then
            eval "add-apt-repository ${INFO[1]}"
            apt-get update
        fi
        # echo "app name: ${INFO[0]}     PPA: >${INFO[1]}<"
        if which ${INFO[0]} > /dev/null 2>&1; then
            echo "     ${INFO[0]} already installed !"
        else
            echo "     installing ${INFO[0]}"
            eval "apt-get install ${INFO[0]}"
        fi
    done
}

install_my_favorite ./list_of_apps.txt
