#!/bin/bash
myhome="/home/$(whoami)"
mysource="/tmp/dotfiles"
for i in $(ls ${mysource}/__*); do
    j=${i##*/}
    k=${j/__/\.}
    cp $i /etc/skel/$k
    ln -s /etc/skel/$k ${myhome}/$k
done
