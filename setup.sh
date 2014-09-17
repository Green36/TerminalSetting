#!/bin/bash

UPDATE_FILES=( \
    ".gitconfig" \
    ".minttyrc" \
    ".screenrc" \
    ".zshrc" \
    ".tmux.conf" \
    )

cd $(dirname $0)
CUR_DIR=`pwd`
BACKUP_DIR="TerminalSettingBackup_"$( date "+%Y%m%d%H%M%S" )

mkdir ~/${BACKUP_DIR}
for file in ${UPDATE_FILES[@]}
do
    if [ -e ~/${file} ]; then
        mv ~/${file} ~/${BACKUP_DIR}/
    fi
    ln -s ${CUR_DIR}/${file} ~/${file}
done

