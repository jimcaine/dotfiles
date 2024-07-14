rm -rf ~/.config/nvim
rm -rf ~/.config/hypr
rm -rf ~/.config/kitty
rm -rf ~/.config/waybar
rm -f ~/.tmux.conf

ln -s ~/.dotfiles/dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/dotfiles/hypr ~/.config/hypr
ln -s ~/.dotfiles/dotfiles/kitty ~/.config/kitty
ln -s ~/.dotfiles/dotfiles/waybar ~/.config/waybar
ln -s ~/.dotfiles/dotfiles/tmux/tmux.conf ~/.tmux.conf
