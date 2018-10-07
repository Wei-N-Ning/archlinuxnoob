
read:

http://regenerus.com/how-to-install-archlinux-on-vmware-workstation/

to watch: (this is more helpful!!!)

https://www.youtube.com/watch?v=Nojq2Ihy_3s


list all the disks available 
```
fdisk -l
```
create 3 partitions

what is partition label type?

read:
https://unix.stackexchange.com/questions/235467/arch-linux-cfdisk-asking-for-disk-label-type
```
cfdisk /dev/sda

# choose dos!!!!
# make sure the boot partition is bootable

boot: 2G
swap: 10G
rest: 50G
```

refer to the video above 

format /dev/sda1 and sda3
```
mkfs.ext4 /dev/sda1
```

sda2 is the swap, therefore require mkswap
```
mkswap /dev/sda2
swapon /dev/sda2
```

create directories and mount partitions
```
mount /dev/sda3 /mnt
cd /mnt
mkdir boot var home
mount /dev/sda1 /mnt/boot
cd ..

```

test internet connection:
```
ping -c 1 www.google.com
```

install base package
```
pacstrap /mnt base
```

synchronize package database
```
pacman -Syu
```

install GRUB
```
pacstrap /mnt grub-bios
```

configuration 
```
genfstab -p /mtn >> /mnt/etc/fstab
```

chroot
```
arch-chroot /mnt /bin/bash
```

set language
```
vi /etc/locale.gen

# find and uncomment en.US UTF8
# then run

locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
```

create host name
```
echo xxxx > /etc/hostname
```

enable DHCP service
```
systemctl enable dhcpcd.service
```

enable OpenSSH service (download openssh package)
```
pacman -S openssh
systemctl enable sshd.service
```

set root password
```
passwd
```

add new user
```
useradd -m -g users -G wheel -s /bin/bash wein
passwd wein
```

install boot loader
```
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -p linux
```

exit, prepare to reboot
```
exit

# in the previous shell
umount /mnt/boot
umount /mnt
reboot
```

#### if everything has been correctly I should see the new boot option screen!!

choose `Arch Linux` option

log in as root, then install the following packages:

```
sudo
neovim  # executable is nvim
python3
gcc
make
cmake
```





