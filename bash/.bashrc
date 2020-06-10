#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias flux='xflux -l 27.577426 -g 83.699871'

source /usr/share/git/completion/git-prompt.sh
source /usr/share/git/completion/git-completion.bash

PATH=$PATH:/home/shadowswalker/.local/bin:/home/shadowswalker/.gem/ruby/2.6.0/bin
PS1='\[\e[32m\]\u\[\e[92m\]@\[\e[32m\]\h \[\e[96m\]\W$(__git_ps1 " \[\e[92m\](\[\e[95m\]%s\[\e[92m\])\[\e[39m\]")\$ '

export PATH=$HOME/.sw/scripts/:$HOME/.config/bspwm/panel:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/shadowswalker/.sw/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/shadowswalker/.sw/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/shadowswalker/.sw/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/shadowswalker/.sw/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

