# install zsh
sudo pacman -Syu --noconfirm zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# update system to use zsh on reboot
chsh -s $(which zsh)
