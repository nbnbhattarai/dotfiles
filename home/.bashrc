#----------------- Hide username in default prompt --------------------#
export DEFAULT_USER="$USERNAME"

#------------ ssh-agent to auto-load ssh key on startup ---------------#
source ~/custom-shell-scripts/ssh-agent.sh

#---------------- ddhorstman's custom git functions -------------------#
source ~/custom-shell-scripts/git-functions.sh

#---------------- Enable https://github.com/nvbn/thefuck --------------#
which thefuck >/dev/null && eval $(thefuck --alias retry)
