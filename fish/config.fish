alias nvimrc "cd ~/dotfiles/nvim && nvim"
alias fishrc "cd ~/dotfiles/fish && nvim config.fish"

# fish
set -g fish_autosuggestion_enabled 0
set -g fish_prompt_pwd_dir_length 0
set -g theme_date_format "+%H:%M"
set -g theme_display_vi no
set -g theme_display_git_default_branch yes
set -g theme_color_scheme nord
fish_vi_key_bindings
set -g fish_vi_force_cursor 1
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore