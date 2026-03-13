# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias ls='ls --color=auto'
PS1=' \[\033[0;35m\]\u@\h\[\033[00m\] \w $GITDIRSTAT \$ '


# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
EDITOR=vi


set -o vi
bind 'set editing-mode vi'
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string >'
bind 'set vi-cmd-mode-string |'

# Terminal color sequence via wpg/wal
if ! [ "$TERM" = "dumb" ];
then
    (cat ~/.config/wpg/sequences &)
fi
force_color_prompt=yes

#set term=xterm=256color

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
