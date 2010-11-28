#!/bin/sh
#ref git://github.com/sugyan/dotfiles/create_link.sh
cd $(dirname $0)
for dotfile in .?*
do
if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
    then
ln -Fis "$PWD/$dotfile" $HOME
    fi
done

