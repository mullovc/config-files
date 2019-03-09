#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# $BACKUP_TGT is the directory of the snapshot to be restored
BACKUP_TGT=$1

if [ ! -f $HOME/.config/rsync-snapshotter/exclude ]
then
    echo error: exclude file not found
    exit 1
fi

rsync -axhv \
    --delete \
    --exclude-from=$HOME/.config/rsync-snapshotter/exclude \
    $BACKUP_TGT/ /

# TODO calculate checksum
