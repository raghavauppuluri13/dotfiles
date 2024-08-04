#!/bin/sh

install_if_not_exists() {
    if ! dpkg -s "$1" > /dev/null 2>&1; then
        echo "installing '$1'"
        sudo apt install "$1" -y
    fi
}

append_if_not_exists() {
    if ! grep -qF "$1" "$2"; then
        echo "appending '$1' to '$2'"
        echo "$1" >> "$2"
    fi
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

# useful packages
install_if_not_exists autojump
install_if_not_exists gpg
install_if_not_exists feh
install_if_not_exists alacritty
install_if_not_exists flameshot 

append_if_not_exists "source $(readlink -f rc.sh)" $RC
append_if_not_exists "source $(readlink -f aliases.sh)" $ALIASES

# install pyenv
curl https://pyenv.run | bash
pyenv install 3.9.18
