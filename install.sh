#!/bin/bash

USER_CONFIG_DIR="${HOME}/.config"

# fish
if command -v omf > /dev/null 2>&1; then
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
  omf install harleen
fi
ln -sfr $PWD/fish/config.fish $USER_CONFIG_DIR/fish

# neovim
find nvim -type f -exec ln -sfr {} $USER_CONFIG_DIR/{} \;
ln -sfr $USER_CONFIG_DIR/nvim/etc/.editorconfig $HOME
