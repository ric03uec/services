#!/bin/bash -e

# the MOUNT_POINT here is an additional disk mounted on the instance.
# If the disk is attached to /dev/sdb, then change the MOUNT_POINT to /dev/xvdb
# i.e. the last letter for both the paths should match
# PS: not sure why AWS can't mount it with the same name

readonly MOUNT_POINT=/dev/xvdb
readonly DATA_DIRECTORY=/data

create_filesystem() {
  echo "Creating filesystem from mount $MOUNT_POINT"
  sudo mkfs.ext4 $MOUNT_POINT
}

mount_filesystem() {
  echo "Mountinf new filesystem to $DATA_DIRECTORY"
  sudo mkdir -p $DATA_DIRECTORY
  echo "$MOUNT_POINT $DATA_DIRECTORY auto noatime 0 0" | sudo tee -a /etc/fstab
  sudo mount $DATA_DIRECTORY
}

create_filesystem
mount_filesystem

