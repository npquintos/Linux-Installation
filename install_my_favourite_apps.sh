# !/bin/bash

function pkg_installer {
    for installer in apt-get yay trizen yaourt yum pacaur packer dnf
    do
        which ${installer} > /dev/null 2>&1
        if [ "$?" == "0" ]; then
            break
        fi
    done
    echo ${installer}
}

function install_cmd {
    case $1 in
        apt-get|dnf )
            echo "$1 install" ;;
        yay|yaourt )
            echo "$1 -S --noconfirm" ;;
        trizen )
            echo "$1 -S --noconfirm --needed --noedit" ;;
        yum )
            echo "$1 -y install" ;;
        pacaur|packer )
            echo "$1 -S --noconfirm --noedit" ;;
    esac
}

function distro_name {
    this_distro=$(ls /etc/*-release | grep -wf distro | sed 's/\/etc\///' | sed 's/-release//')
    case $this_distro in
        redhat | centos )
            echo "redhat" ;;
        ubuntu | mint | debian | mx )
            echo "debian" ;;
        arch | arco | manjaro
            echo "arch" ;;
    esac
}

function app_exists {
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

PACKAGE_INSTALLER=$(pkg_installer)
INSTALL_COMMAND=$(install_cmd $PACKAGE_INSTALLER)
CHECK_IF_IT_EXISTS=$(app_exists "${PACKAGE_INSTALLER}")
IFS=$'\n'
for APP in $(sed 's/ *#.*$//' list_of_apps.txt)
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

