#!/bin/sh

# ---
# ANT
# ---

ant

if [ $? != 0 ]
then
echo "Ant failed, exiting"
  exit 2
fi

sleep 1

#--------------------------------------------------
# Manually Adjust Info.plist File (Add Hi-Res Key)
#--------------------------------------------------

sh _addHiResKeyToPlistFile.sh



