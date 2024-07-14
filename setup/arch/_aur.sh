# clone
git clone https://aur.archlinux.org/yay.git

# install
cd yay
makepkg -si --noconfirm

# cleanup
cd -
rm -rf yay

# update yay
yay -Syu --noconfirm
