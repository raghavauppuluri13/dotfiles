#!/bin/sh

remove_line_containing() {
    echo "removing $1 from $2"
    sed -i "/$1/d" $2
}

if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
  ALIASES="$HOME/.zsh_aliases"
  RC="$HOME/.zshrc"
elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
  ALIASES="$HOME/.bash_aliases"
  RC="$HOME/.bashrc"
else
    # User is using another shell
    echo "User is unsupported shell!"
    exit
fi

remove_line_containing "rc.sh" $RC
remove_line_containing "aliases.sh" $ALIASES

# WARNING: uncommenting will lose data!
#rm -rf $HOME/.vim
#rm $HOME/.vimrc
#rm $HOME/.tmux.conf
#rm -rf $HOME/.config/tmux
