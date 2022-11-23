#!/usr/bin/bash 
# Download Nerd Fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FantasqueSansMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Meslo.zip
# Install PowerLevel10 prompt
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
# Install AstroNvim
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
mkdir ~/.config/nvim/lua/user
nvim
