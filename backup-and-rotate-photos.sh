#!/bin/bash
#
# original work : http://danielmcgraw.com/2010/02/25/Incremental-Rotating-Backups-With-Rsync/
#

# This script creates a 7 weeks long rotating backup of the photos
# at the PATH for the USER on the HOST that you specify.
# Can be run by hand, but would suggest creating a cron job.

# Vars
# The path to the folder you want to back up (e.g. /home/bob)
DIRPATH='/media/wd1to/1TO/photos' 
# the path to thes folders where you want to store backups 
BACKUPDIRPATH='/media/wd2to/2TO/backup/photos'

# Check to make sure the folders exist, if not creates them.
mkdir -p $BACKUPDIRPATH.{0..7}

# Delete the oldest backup folder.
rm -rf $BACKUPDIRPATH.7

# Shift all the backup folders up a day.
for i in {7..1}
do
    mv $BACKUPDIRPATH.$[${i}-1] $BACKUPDIRPATH.${i}
done

# Create the new backup hard linking with the previous backup.
# This allows for the least amount of data possible to be
# transfered while maintaining a complete backup.
rsync -a --delete --link-dest=$BACKUPDIRPATH.1 ${DIRPATH}/ $BACKUPDIRPATH.0/
