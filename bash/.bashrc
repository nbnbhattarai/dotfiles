#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'

source /usr/share/git/completion/git-prompt.sh
source /usr/share/git/completion/git-completion.bash

PS1='\[\e[32m\]\u\[\e[92m\]@\[\e[32m\]\h \[\e[96m\]\W$(__git_ps1 " \[\e[92m\](\[\e[95m\]%s\[\e[92m\])\[\e[39m\]")\$ '

#--- Starting for NVM settings ---
#[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
#source /usr/share/nvm/nvm.sh
#source /usr/share/nvm/bash_completion
#source /usr/share/nvm/install-nvm-exec
#--- end of NVM ---

# keychain
eval $(keychain --eval --quiet ys_rsa)
