#!/bin/sh
 
### ABOUT
### Runs rsync, retrying on errors up to a maximum number of tries.
### Simply edit the rsync line in the script to whatever parameters you need.
 
# Trap interrupts and exit instead of continuing the loop
trap "echo Exited!; exit;" SIGINT SIGTERM

MAX_RETRIES=50

RSYNC_OPTIONS="-aurP --ignore-existing --delete --timeout=15"

# Set the initial return value to failure
i=0
false
while [ $? -ne 0 -a $i -lt $MAX_RETRIES ]
do
 i=$(($i+1))
 ls /mnt/nas/backup
 echo "Documents"
 echo time rsync $RSYNC_OPTIONS /home/david/Documents/ /mnt/nas/backup/Documents/
 time rsync $RSYNC_OPTIONS /home/david/Documents/ /mnt/nas/backup/Documents/
done 
if [ $i -eq $MAX_RETRIES ]
then
  echo "Hit maximum number of retries, giving up."
###  exit
fi

i=0
false
while [ $? -ne 0 -a $i -lt $MAX_RETRIES ]
do
 i=$(($i+1))
 ls /mnt/nas/backup
 echo "BD"
 echo time rsync $RSYNC_OPTIONS /home/david/ElectricCloud/BD/ /mnt/nas/backup/ElectricCloud/BD/
 time rsync $RSYNC_OPTIONS /home/david/ElectricCloud/BD/ /mnt/nas/backup/ElectricCloud/BD/
done 
if [ $i -eq $MAX_RETRIES ]
then
  echo "Hit maximum number of retries, giving up."
###  exit
fi

i=0
false 
while [ $? -ne 0 -a $i -lt $MAX_RETRIES ]
do
 i=$(($i+1))
 ls /mnt/nas/backup
 echo "PM"
 echo time rsync $RSYNC_OPTIONS /home/david/ElectricCloud/PM/ /mnt/nas/backup/ElectricCloud/PM/
 time rsync $RSYNC_OPTIONS /home/david/ElectricCloud/PM/ /mnt/nas/backup/ElectricCloud/PM/
done 
if [ $i -eq $MAX_RETRIES ]
then
  echo "Hit maximum number of retries, giving up."
###  exit
fi

i=0
false
while [ $? -ne 0 -a $i -lt $MAX_RETRIES ]
do
 i=$(($i+1))
 ls /mnt/nas/backup
 echo "VBOX"
 echo time rsync $RSYNC_OPTIONS --inplace -vvz --no-W /home/david/VirtualBox\ VMs/ /mnt/nas/backup/ElectricCloud/VBox_VMs/
 time rsync $RSYNC_OPTIONS --inplace -vvz --no-W /home/david/VirtualBox\ VMs/ /mnt/nas/backup/ElectricCloud/VBox_VMs/
done 
if [ $i -eq $MAX_RETRIES ]
then
  echo "Hit maximum number of retries, giving up."
###  exit
fi



