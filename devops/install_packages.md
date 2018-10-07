
#### what to do after a flesh install

look around, python3 and bash should be by default installed

Why am I getting `database file does not exist` warnings?

read:
https://bbs.archlinux.org/viewtopic.php?id=136596

```
pacman -Syu --debug

# (-S) synchronise, (-u) upgrade, (-y) refresh the local package database
```

Install git
```
pacman -S git
```

#### what I should RELLY do to install a new system

the "system" booted from image file in vmware is a boot system - 
similar to windows' diskless system; any change made there is not 
persistent

read:
https://wiki.archlinux.org/index.php/installation_guide#Chroot

switch between different TTYs (useful!!)
```
ALT + arrow (left/right) 
```

they call it virtual console 

partition disks
```
# to identify available devices

fdisk -l
```

to format partition:
```
mkfs.ext4 /dev/sda
```

to mount the file system on the root partition to /mnt
```
mount /dev/sda /mnt
```

create mount points for any remaining partitions and mount them accodingly
```
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot
```

install packages (baes packages)
```
pacstrap /mnt base
```

configure system
```
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
```

network configuration - refer to the article:
https://wiki.archlinux.org/index.php/installation_guide#Chroot

create root password
```
passwd
```

reboot

#### install archlinux on Vmware

this is still in progress

I can not reuse the image downloaded because each time it will go
back to step one, ignoring the newly installed system



