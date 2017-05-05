# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/gulliver/.local/share/omf"

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG "/Users/gulliver/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# homebrew
set -U fish_user_paths /usr/local/bin $fish_user_paths

# local
set -x PATH /usr/local/bin $PATH
# Qt
set -x PATH /Applications/Qt/5.5.1/5.5/clang_64/bin $PATH
# nodebrew
set -x PATH $HOME/.nodebrew/current/bin $PATH
# rbenvp
#eval "$(rbenv init -)";
#set -x PATH $HOME/.rbenv/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# plugins
set fish_plugin peco

# cd > ls
function cd
  builtin cd $argv
  ls -a
end

# peco
function peco
  command peco --layout=bottom-up $argv
end

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end


# Git設定
git config --global user.name "kojiro.yamashiro"
git config --global user.email "kojiro.yamashiro@glv.co.jp"
git config --global color.ui auto

# Git エイリアス
alias git-log-line='git log --oneline --graph'
alias git-log='git log --graph'
alias git-commit-allemp-m='git-commit --allow-empty -m'

# 短縮エイリアス
alias ll='ls -laG'
alias rm='rmtrash'
alias cp='cp -iv'
alias mv='mv -iv'
alias ..='cd ../'
alias ..2='cd ../../'
alias ..3='cd ../../../'

# alias for local mysql
alias mydb='mysql -h127.0.0.1 -uroot --password=docker --port=3306'

# encoding
set -x LANG ja_JP.UTF-8
