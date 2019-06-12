# Linux-Installation
Ideal way to install a Linux Distro

An ideal intallation would be:
1.  fast start-up time
2.  Easy re-installation of Distro

To this end:
1.  Install OS and executables to SSD
2.  Install /home, /var, /tmp, to HD

Basic Steps:
1.  If this is not the first time, pull out the hard disk so that it is not overwritten during the Linux Distro installation.
2.  Install the Linux Distro to an SSD. Use only one partition - /. In this way, you maximize the disk space and not run out of space on your /usr/bin or /var directories.
3.  If this is the very first time, your HD would be blank. Format and mount it to /hd. Use the blkid command to determine the UUID of your hard disk. If this is not the first time, pull out this disk so that it is untouched during installation in Step 1. 

Sample ##/etc/fstab## will look like this:

\# /etc/fstab: static file system information.

\# Use 'blkid' to print the universally unique identifier for a

\# device; this may be used with UUID= as a more robust way to name devices

\# that works even if disks are added and removed. See fstab(5).

\# <file system> <mount point>   <type>  <options>       <dump>  <pass> 
  
\# / was on /dev/sda1 during installation

UUID=4e40df13-dbe0-4aae-b378-6a5950d9ca8f /               ext4    errors=remount-ro 0       1

\# /hd was on /dev/sda2 during installation
UUID=858d78e2-550f-45e2-becc-117cef6553b2 /hd             ext4    defaults        0       2
  
\# swap was on /dev/sda1 during installation
UUID=109abccf-7c8b-404a-b68e-2ffa168bc4ca none            swap    sw              0       0

/hd/var      /var     none    bind       0     0

/hd/tmp      /tmp     none    bind       0     0

/hd/home     /home    none    bind       0     0

/hd/opt      /opt     none    bind       0     0
  



