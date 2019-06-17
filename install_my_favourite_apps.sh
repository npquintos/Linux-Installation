# !/bin/bash

function install_cmd {
    for install_cmd in 'apt-get' 'yay' 'trizen' 'yaourt' 'pacaur' 'packer' 'yum'
    do
	which ${install_cmd} > /dev/null 2>&1
	if [ "$?" == "0" ]; then
	    break
	fi
    done
    case ${install_cmd} in
        apt_get )
	    echo "apt-get install" ;;
        yay|yaourt )
	    echo "${install_cmd} -S --noconfirm" ;;
        trizen )
	    echo "${install_cmd} -S --noconfirm --needed --noedit" ;;
        pacaur|packer )
	    echo "${install_cmd} -S --noconfirm --noedit" ;;
	yum )
	    echo "${install_cmd} -y install" ;;
    esac
}

APP_LIST=$(cat list_of_apps.txt)
COMMAND=$(install_cmd)
while read -r APP; do
    echo "${APP} is about to be checked"
    if which ${APP} > /dev/null 2>&1; then
        echo "installing ${APP}"
	echo "${COMMAND} ${APP}"
        eval "${COMMAND} ${APP}"
    else
        echo "${APP} already installed !"
    fi
done < list_of_apps.txt

