# !/bin/bash

function distro {
    result=$(lsb_release --id | awk '{print $3}')
    echo ${result^^}
}

function install_cmd {
    case $1 in
        REDHATENTERPRISESERVER|REDHAT )
            echo "yum" ;;
        ARCH|ARCO|MANJARO )
            echo "pacman -S" ;;
        DEBIAN|UBUNTU|MINT|MX )
            echo "apt-get install" ;;
    esac
}

APP_LIST=$(cat list_of_apps.txt)
DISTRO=$(distro)
COMMAND=$(install_cmd ${DISTRO})
echo "distro is ${DISTRO}"
for APP in $APP_LIST
do
    which ${APP} > /dev/null 2>&1
    if [ "$?" != "0" ]; then
        echo "installing ${APP}"
        # eval "${COMMAND} ${APP}"
    else
        echo "${APP} already installed !"
    fi
done
