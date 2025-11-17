# Arch Installation & Setup
### Download ISO & Write To USB
* Download iso from mirrors page: `https://archlinux.org/download/#download-mirrors`.

```bash
# identify the drive
lsblk

# identify the drive (alternative)
sudo fdisk -l

# unmount if mounted
sudo umount /dev/sdX1

# write to usb
sudo dd if=path/to/archlinux.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

### Run Arch Install
* Connect to wifi using `iwctl`.
* Update `/etc/pacman.conf`.
    * Uncomment `Color` and `ParallelDownloads = 5`, add `ILoveCandy` under `[options]`.
* Run `archinstall`.
    * Choose local mirrors.
    * Configure disk - use `btrfs` by default.
    * Configure bootloader - use `Grub` by default.
    * Update hostname.
    * Set password.
    * Create user.
    * Do not select audio server for desktop - can try for laptop.
    * Addition packages: `networkmanager vim git`
    * Network configuration: `NetworkManager`
    * Update timezone
    * Install
    * Reboot

### Post Install
#### Connect To Wifi
```bash
nmcli device wifi connect ${WIFI_NAME} password ${WIFI_PASSWORD}
```

#### Run Setup Script
```bash
```
