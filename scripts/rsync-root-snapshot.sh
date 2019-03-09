#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

date=`date "+%Y-%m-%d_%T"`

# $BACKUP_TGT is the root directory for incremental backups
# $BACKUP_TGT/last is a symlink to the last increment
BACKUP_TGT=$1

if [ ! -f $HOME/.config/rsync-snapshotter/exclude ]
then
    echo error: exclude file not found
    exit 1
fi

rsync -axhv \
    --exclude-from=$HOME/.config/rsync-snapshotter/exclude \
    --link-dest=$BACKUP_TGT/last/ \
    / $BACKUP_TGT/$date | tee $BACKUP_TGT/$date.log

# TODO calculate checksum

rm -f $BACKUP_TGT/last
ln -s $BACKUP_TGT/$date $BACKUP_TGT/last
