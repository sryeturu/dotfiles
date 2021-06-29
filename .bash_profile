#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# .profile not read on arch if .bash_profile exists, sourcing .profile here
[[ -f ~/.profile ]] && . ~/.profile
