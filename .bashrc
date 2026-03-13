# .bashrc
#
#
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias ls='ls --color=auto'

# Shell prompt
PS1=' \[\033[0;35m\]\h\[\033[00m\] \w \$ '


# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
EDITOR=vi


# Readline settings
set -o vi
bind 'set editing-mode vi'
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string >'
bind 'set vi-cmd-mode-string |'

# Terminal color sequence via wpg/wal
#(cat ~/.config/wpg/sequences &)
force_color_prompt=yes


# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi


# Run the todo every time
#tdp
