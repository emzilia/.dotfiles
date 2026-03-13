# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
EDITOR=vi

(cat ~/.config/wpg/sequences &)
alias clr=clear
alias dilb='fm6000 -m 13 -g 11 -l 25'
# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
. "$HOME/.cargo/env"
alias config='/usr/bin/git --git-dir=/home/emm/.cfg --work-tree=/home/emm'

alias gits='git status'


alias nmcliup='nmcli connection up DEA_SURVEILLANCE_37'
alias nmclidown='nmcli connection down DEA_SURVEILLANCE_37'

alias rg='ranger'

alias howdoiconnect='echo nmcli d wifi connect *ssid* password *password*'

alias weather='curl wttr.in'
