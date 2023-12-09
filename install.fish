# default user config directory
set USER_CONFIG_DIR "$HOME/.config"

# fish
mkdir -p $USER_CONFIG_DIR/fish/functions
find fish -type f -exec ln -sf $PWD/{} $USER_CONFIG_DIR/{} \;
if not type -q omf
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
end
find omf -type f -exec ln -sf $PWD/{} $USER_CONFIG_DIR/{} \;

# neovim
rm -r $USER_CONFIG_DIR/nvim
mkdir -p $USER_CONFIG_DIR/nvim/{etc,lua}
find nvim -type f -exec ln -sf $PWD/{} $USER_CONFIG_DIR/{} \;
ln -sf $USER_CONFIG_DIR/nvim/etc/.editorconfig $HOME