#!/bin/bash -e

################### Description ###############################
# basic shell script to create swap space on the hosts
#
################### Verified Platforms ########################
# ubuntu 12.04
# ubuntu 14.04
###############################################################

## amount of swap space in MB
SWAP_SIZE=5120
SWAP_FILE=/root/.__swap__
BLOCK_SIZE=1M

###############################################################

function create_swap {
  echo "Creating and allocating space to swap file: $SWAP_FILE" 
  dd if=/dev/zero of=$SWAP_FILE bs=$BLOCK_SIZE count=$SWAP_SIZE
  chmod 600 $SWAP_FILE
  mkswap $SWAP_FILE
  swapon $SWAP_FILE
}

function write_fstab {
  echo "Updating fstab entry"
  echo "$SWAP_FILE none swap sw 0 0" | sudo tee -a /etc/fstab
}

create_swap
write_fstab
