# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


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
bind 'set vi-ins-mode-string -'
bind 'set vi-cmd-mode-string |'

# Terminal color sequence via wpg/wal
(cat ~/.config/wpg/sequences &)
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


alias config='/usr/bin/git --git-dir=/home/emm/.cfg --work-tree=/home/emm'

alias gits='git status'
alias gitall='git add -A'
alias gitcm='git commit -m'

alias dilb='fm6000 -m 13 -g 11 -l 25'

alias nmcliup='nmcli connection up DEA_SURVEILLANCE_37'
alias nmclidown='nmcli connection down DEA_SURVEILLANCE_37'

alias rg='ranger'

alias howdoiconnect='echo nmcli d wifi connect *ssid* password *password*'

alias weather='curl wttr.in'

alias tin='tt++ .tintin/run.tin'

alias coderemote='ssh -L 8080:127.0.0.1:8080 remote'
