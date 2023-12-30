#!/bin/sh
# git configs

git config --global user.name "Raghava Uppuluri"
git config --global user.email raghava.upp13@gmail.com
git config --global core.editor vim

# useful terminal terminal commands
sudo apt install autojump -y
echo ". /usr/share/autojump/autojump.bash" >> ~/.bashrc

# install eza
sudo apt update
sudo apt install -y gpg

if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
  RC='~/.zsh_aliases'
elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
  RC='~/.bash_aliases'
else
    # User is using another shell
    echo "User is unsupported shell!"
    exit
fi

echo 'alias ag="ag --smart-case --color-path \"31;1\" --color-match \"32;1\" --color-line-number \"34;1\""' >> $RC
