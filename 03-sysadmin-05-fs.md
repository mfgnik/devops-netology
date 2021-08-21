1. Прочитал.

2. Нет, не могут, так как оба жесткие ссылки имеют один и тот же inode.

3.
Создал. (Так как у меня Mac на M1 все задания делаю не в Vagrant, а через виртуальную машину, созданную в Parallels)
```
parallels@ubuntu-linux-20-04-desktop:~$ lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
loop0    7:0    0   62M  1 loop /snap/lxd/21032
loop1    7:1    0 48.9M  1 loop /snap/core18/2127
loop2    7:2    0 61.7M  1 loop /snap/lxd/19206
loop3    7:3    0   27M  1 loop /snap/snapd/10709
loop4    7:4    0 28.1M  1 loop /snap/snapd/12707
loop5    7:5    0 48.9M  1 loop /snap/core18/2073
sda      8:0    0   64G  0 disk 
├─sda1   8:1    0  512M  0 part /boot/efi
└─sda2   8:2    0 63.5G  0 part /
sdb      8:16   0  2.5G  0 disk 
sdc      8:32   0  2.5G  0 disk 
sr0     11:0    1 1024M  0 rom  
```
4. 
Разделил
```
Device     Boot   Start     End Sectors  Size Id Type
/dev/sdb1          2048 4196351 4194304    2G 83 Linux
/dev/sdb2       4196352 5242879 1046528  511M 83 Linux
```

5. Делаем командой 
```
sudo sfdisk -d /dev/sdb| sudo sfdisk --force /dev/sdc
```
И теперь имеем
```
Device     Boot   Start     End Sectors  Size Id Type
/dev/sdc1          2048 4196351 4194304    2G 83 Linux
/dev/sdc2       4196352 5242879 1046528  511M 83 Linux
```

6. Команда - 
```
sudo mdadm --create  /dev/md1 -l 1 -n 2 /dev/sd{b1,c1}
```

7. Команда - 
```
sudo mdadm --create /dev/md0 -l 1 -n 2 /dev/sd{b2,c2}
```

8. Команда - 
```
sudo pvcreate /dev/md1 /dev/md0
```

9. Команда -
```
sudo vgcreate vg1 /dev/md1 /dev/md0
```

10. Команда - 
```
sudo lvcreate -L 100M vg1 /dev/md0
```

11. Команда - 
```
sudo mkfs.ext4 /dev/vg1/lvol0
```

12. Команда - 
```
mkdir /tmp/new
sudo mount /dev/vg1/lvol0 /tmp/new
```

13. Сделал

14.

```
parallels@ubuntu-linux-20-04-desktop:~$ lsblk
NAME            MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
loop0             7:0    0   62M  1 loop  /snap/lxd/21032
loop1             7:1    0 48.9M  1 loop  /snap/core18/2127
loop2             7:2    0 61.7M  1 loop  /snap/lxd/19206
loop3             7:3    0   27M  1 loop  /snap/snapd/10709
loop4             7:4    0 28.1M  1 loop  /snap/snapd/12707
loop5             7:5    0 48.9M  1 loop  /snap/core18/2073
sda               8:0    0   64G  0 disk  
├─sda1            8:1    0  512M  0 part  /boot/efi
└─sda2            8:2    0 63.5G  0 part  /
sdb               8:16   0  2.5G  0 disk  
├─sdb1            8:17   0    2G  0 part  
│ └─md1           9:1    0    2G  0 raid1 
└─sdb2            8:18   0  511M  0 part  
  └─md0           9:0    0  510M  0 raid1 
    └─vg1-lvol0 253:0    0  100M  0 lvm   /tmp/new
sdc               8:32   0  2.5G  0 disk  
├─sdc1            8:33   0    2G  0 part  
│ └─md1           9:1    0    2G  0 raid1 
└─sdc2            8:34   0  511M  0 part  
  └─md0           9:0    0  510M  0 raid1 
    └─vg1-lvol0 253:0    0  100M  0 lvm   /tmp/new
sr0              11:0    1 1024M  0 rom
```

15. 
```
parallels@ubuntu-linux-20-04-desktop:~$ gzip -t /tmp/new/test.gz && echo $?
0
```

16. Команда - 
```
sudo pvmove /dev/md0
```

17. Команда -

```
sudo mdadm /dev/md1 --fail /dev/sdb1
```

18.

```
parallels@ubuntu-linux-20-04-desktop:~$ dmesg |grep md1
[20327.514891] md/raid1:md1: not clean -- starting background reconstruction
[20327.514894] md/raid1:md1: active with 2 out of 2 mirrors
[20327.514916] md1: detected capacity change from 0 to 2144337920
[20327.521160] md: resync of RAID array md1
[20337.900918] md: md1: resync done.
[21899.513866] md/raid1:md1: Disk failure on sdb1, disabling device.
               md/raid1:md1: Operation continuing on 1 devices.
```

19.

```
parallels@ubuntu-linux-20-04-desktop:~$ gzip -t /tmp/new/test.gz && echo $?
0
```

