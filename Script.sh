#!/bin/bash

# Update package repositories
sudo apt update

# Install mdadm (RAID management tool)
sudo apt install -y mdadm

# Define variables
NUM_OF_DISKS=2  # Change this based on the number of disks you have
RAID_LEVEL=0    # Change this based on your RAID configuration (0 for RAID0, 1 for RAID1, etc.)
RAID_DEVICE="/dev/md0"  # RAID device name

# Create RAID array
sudo mdadm --create $RAID_DEVICE --level=$RAID_LEVEL --raid-devices=$NUM_OF_DISKS /dev/xvdb /dev/xvdc  # Update disk names as per your configuration

# Check RAID status
sudo mdadm --detail --scan | sudo tee -a /etc/mdadm/mdadm.conf

# Format the RAID array (Optional: you may choose to use another file system type)
sudo mkfs.ext4 $RAID_DEVICE

# Mount the RAID array to a directory
sudo mkdir /mnt/raid
sudo mount $RAID_DEVICE /mnt/raid

# Update /etc/fstab to mount RAID array on boot
echo "$RAID_DEVICE  /mnt/raid  ext4  defaults,nofail  0  2" | sudo tee -a /etc/fstab
