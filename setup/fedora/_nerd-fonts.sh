curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/SourceCodePro.zip
mkdir ~/.local/share/fonts
unzip SourceCodePro.zip -d ~/.local/share/fonts/
fc-cache ~/.local/share/fonts
rm SourceCodePro.zip
