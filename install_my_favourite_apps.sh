# !/bin/bash

function install_cmd {
    for install_cmd in 'apt-get' 'yay' 'trizen' 'yaourt' 'pacaur' 'packer'
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
    esac
}

APP_LIST=$(cat list_of_apps.txt)
COMMAND=$(install_cmd)
for APP in ${APP_LIST}
do
    echo "${APP} is about tobe checked"
    if which ${APP} > /dev/null 2>&1; then
        echo "installing ${APP}"
	echo "${COMMAND} ${APP}"
        eval "${COMMAND} ${APP}"
    else
        echo "${APP} already installed !"
    fi
done
