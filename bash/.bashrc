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

#--- Starting for NVM settings ---
# [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
# source /usr/share/nvm/nvm.sh
# source /usr/share/nvm/bash_completion
# source /usr/share/nvm/install-nvm-exec
#--- end of NVM ---

PATH=$PATH:/home/shadowswalker/.local/bin:/home/shadowswalker/.gem/ruby/2.6.0/bin
PS1='\[\e[32m\]\u\[\e[92m\]@\[\e[32m\]\h \[\e[96m\]\W$(__git_ps1 " \[\e[92m\](\[\e[95m\]%s\[\e[92m\])\[\e[39m\]")\$ '

#export ANDROID_HOME=$HOME/Android/Sdk
#export PATH=$PATH:$ANDROID_HOME/emulator
#export PATH=$PATH:$ANDROID_HOME/tools
#export PATH=$PATH:$ANDROID_HOME/tools/bin
#export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$HOME/.sw/scripts/:/home/shadowswalker/.config/bspwm/panel:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
#         . "/opt/anaconda/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/anaconda/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

