alias nvimrc "cd ~/.config/nvim && nvim"
alias fishrc "nvim ~/.config/fish/config.fish"
alias kittyrc "nvim ~/.config/kitty/kitty.conf"
alias awesomerc "nvim ~/.config/awesome/rc.lua"
alias ssh='env TERM=xterm-256color ssh'

# fish
set -g fish_greeting
set -g fish_autosuggestion_enabled 0
set -g EDITOR "vim"
fish_vi_key_bindings
functions -e fish_mode_prompt
