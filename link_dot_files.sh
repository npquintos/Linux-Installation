#!/bin/bash

skel_location=/etc/skel/
for user_dir in $(grep home /etc/passwd | awk -F':' '{print $6}')
do
    echo ""
    echo "linking dot files for ${user_dir}"
    for dotfile in $(ls -A ${skel_location})
    do
        echo "    creating soft link for ${skel_location}${dotfile} --> ${user_dir}/${dotfile}"
        # ln -s ${skel_location}${dotfile} ${user_dir}/${dotfile}
    done
done
