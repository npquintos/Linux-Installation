#!/bin/bash
myhome="/home/$(logname)"
mysource="/tmp/dotfiles"
mkdir -p /etc/skel
for i in $(ls ${mysource}/__*); do
    j=${i##*/}
    k=${j/__/\.}
    echo "cp $i /etc/skel/$k"
    cp -f $i /etc/skel/$k
    echo "cp /etc/skel/$k ${myhome}/$k"
    cp -f /etc/skel/$k ${myhome}/$k
    chown $(logname):$(logname) ${myhome}/$k
done
cp -f ${mysource}/init.vim /etc/skel/init.vim
mkdir -p ${myhome}/.config/nvim
cp -f /etc/skel/init.vim ${myhome}/.config/nvim/.
chown $(logname):$(logname) ${myhome}/.config/nvim/init.vim
mkdir -p /etc/skel/color
cp -f ${mysource}/flattened_darkq.vim /etc/skel/color/.
cp -f ${mysource}/flattened_light.vim /etc/skel/color/.
cp -f /etc/skel/color/flattened_darkq.vim ${myhome}/.vim/colors/.
chown $(logname):$(logname) ${myhome}/.vim/colors/flattened_darkq.vim
cp -f /etc/skel/color/flattened_light.vim ${myhome}/.vim/colors/.
chown $(logname):$(logname) ${myhome}/.vim/colors/flattened_light.vim
