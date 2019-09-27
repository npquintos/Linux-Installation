# !/bin/bash

function pkg_installer() {
    for installer in apt-get yay trizen pacman yum dnf 
    do
        which ${installer} > /dev/null 2>&1
        if [ "$?" == "0" ]; then
            break
        fi
    done
    echo ${installer}
}

function install_cmd() {
    case $1 in
        apt-get|dnf )
            echo "$1 install" ;;
        yay )
            echo "$1 -S --noconfirm" ;;
        trizen )
            echo "$1 -S --noconfirm --needed --noedit" ;;
        yum )
            echo "$1 -y install" ;;
        pacman )
            echo "$1 -S --noconfirm --noedit" ;;
    esac
}

function distro_name() {
    case $1 in
       apt-get )
            echo "debian" ;;
        yay | trizen | pacman)
            echo "arch" ;;
        yum | dnf )
            echo "redhat" ;;
    esac
}

function app_exists() {
    case $1 in
        apt-get|dnf )
            echo "which" ;;
        yay|yaourt )
            echo "which" ;;
        trizen )
            echo "which" ;;
        yum )
            echo "which" ;;
            # echo "yum list installed" ;;
        pacaur|packer )
            echo "which" ;;
    esac
}

function install_my_favorite() {
    IFS=$'\n'
    echo "about to install packages contained in $1"
    for APP in $(sed 's/ *#.*$//' $1)
    do
        echo ">>>> ${APP} <<<< is about to be checked"
        ${CHECK_IF_IT_EXISTS} ${APP} > /dev/null 2>&1
        echo $?
        if ${CHECK_IF_IT_EXISTS} ${APP} > /dev/null 2>&1; then
            echo "     ${APP} already installed !"
        else
            echo "     installing ${APP}"
            echo "     ${INSTALL_COMMAND} ${APP}"
           eval "${INSTALL_COMMAND} ${APP}"
        fi
    done
}

PACKAGE_INSTALLER=$(pkg_installer)
INSTALL_COMMAND=$(install_cmd $PACKAGE_INSTALLER)
CHECK_IF_IT_EXISTS=$(app_exists "${PACKAGE_INSTALLER}")
install_my_favorite("list_of_apps.txt")
CONDA_DEPENDENCY=$(distro_name($PACKAGE_INSTALLER))_conda
install_my_favorite($CONDA_DEPENDENCY)

