#!/bin/sh

alias dir_open="cd \$(find . -type d -print | fzf)"
alias ag="ag --smart-case --color-path \"31;1\" --color-match \"32;1\" --color-line-number \"34;1\""
alias gitrag="git -c user.name='Raghava Uppuluri' -c user.email='raghava.upp13@gmail.com' -c core.editor='vim'"
alias file_open="vim \$(fzf)"
