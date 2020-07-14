#!/bin/bash
myhome="/home/$(logname)"
mysource="/tmp/dotfiles"
mkdir -p /etc/skel
for i in $(ls ${mysource}/__*); do
    j=${i##*/}
    k=${j/__/\.}
    echo "cp $i /etc/skel/$k"
    cp -f $i /etc/skel/$k
    echo "ln -s /etc/skel/$k ${myhome)/$k"
    ln -s /etc/skel/$k ${myhome}/$k
done
cp -f ${mysource}/init.vim /etc/skel/init.vim
mkdir -p ${myhome}/.config/nvim
ln -s /etc/skel/init.vim ${myhome}/.config/nvim/.
mkdir -p /etc/skel/color
cp -f ${mysource}/flattened_darkq.vim /etc/skel/color/.
cp -f ${mysource}/flattened_light.vim /etc/skel/color/.
ln -s /etc/skel/color/flattened_darkq.vim ${myhome}/.vim/colors/.
ln -s /etc/skel/color/flattened_light.vim ${myhome}/.vim/colors/.
