mkdir -p $HOME/.config
git clone https://github.com/jimcaine/dotfiles.git $HOME/.dotfiles

rm -f ~/.tmux.conf
ln -s ~/.dotfiles/dotfiles/tmux/tmux.conf ~/.tmux.conf

rm -rf ~/.config/nvim
ln -s ~/.dotfiles/dotfiles/nvim ~/.config/nvim

rm -rf ~/.config/hypr
ln -s ~/.dotfiles/dotfiles/hypr ~/.config/hypr

rm -rf ~/.config/kitty
ln -s ~/.dotfiles/dotfiles/kitty ~/.config/kitty

rm -rf ~/.config/waybar
ln -s ~/.dotfiles/dotfiles/waybar ~/.config/waybar

rm -rf ~/.config/rofi
ln -s ~/.dotfiles/dotfiles/rofi ~/.config/rofi

rm -rf ~/.config/wlogout
ln -s ~/.dotfiles/dotfiles/wlogout ~/.config/wlogout

rm -rf ~/.zshrc-modules
rm ~/.zshrc
ln -s ~/.dotfiles/dotfiles/zshrc/.zshrc-modules ~/.zshrc-modules
ln -s ~/.dotfiles/dotfiles/zshrc/.zshrc ~/.zshrc
