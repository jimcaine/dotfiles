# Arch Installation & Setup
* Download iso from mirrors page: `https://archlinux.org/download/#download-mirrors`.
* Connect to wifi using `iwctl`.
* Update `/etc/pacman.conf`.
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
    * Chroot and perform post-installation steps.
* Run `set.sh`.
* Post install checklist:
    * Login to git and set up ssh.
    * Set up copilot.
    * Login to gcloud cli.
    * Download wallpapers.

### Setup
```bash
export WIFI_NAME=...
export WIFI_PASSWORD=...
export GIT_EMAIL=""
export GIT_NAME=""
git clone https://github.com/jimcaine/dotfiles ~/.dotfiles
bash ~/.dotfiles/setup.sh

# TODO::: refactor sddm
sudo systemctl enable sddm.service
sudo systemctl enable sddm.service --now # enable and logout

# TODO::: refactor sddm themes
wget ... # download from site
sudo tar -xzvf sugar-candy.tar.gz
sudo cp -r sugar-candy /usr/share/sddm/themes
```
