#!/bin/bash
myhome="/home/$(whoami)"
mysource="/tmp/dotfiles"
for i in $(ls ${mysource}/__*); do
    j=${i##*/}
    k=${j/__/\.}
    cp $i /etc/skel/$k
    ln -s /etc/skel/$k ${myhome}/$k
done
cp ${mysource}/init.vim /etc/skel/init.vim
ln -s /etc/skel/init.vim ${myhome}/.config/nvim/.
mkdir /etc/skel/color
cp ${mysource}/flattened_darkq.vim /etc/skel/color/.
cp ${mysource}/flattened_light.vim /etc/skel/color/.
ln -s /etc/skel/color/flattened_darkq.vim ${myhome}/.vim/colors/.
ln -s /etc/skel/color/flattened_light.vim ${myhome}/.vim/colors/.
