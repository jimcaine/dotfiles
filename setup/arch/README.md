# Arch Installation & Setup
### Installation
```bash
iwctl ...
sudo vim /etc/pacman.conf
archinstall
```

### Setup
```bash
export WIFI_NAME=...
export WIFI_PASSWORD=...
```

```bash
nmcli device wifi connect ${WIFI_NAME} password ${WIFI_PASSWORD}
sudo pacman -S --noconfirm git go
git clone https://github.com/jimcaine/dotfiles.git ~/.dotfiles
bash ~/.dotfiles/setup/arch/setup.sh
```

### Next Steps
#### Login To Github
#### Authenticate Copilot
#### Login To Cloud Providers
