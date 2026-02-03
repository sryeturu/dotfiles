# ~/.bashrc
# Arch Linux–style bashrc

# --------------------------------------------------
# Exit if not running interactively
# --------------------------------------------------
[[ $- != *i* ]] && return

# --------------------------------------------------
# History
# --------------------------------------------------
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# --------------------------------------------------
# Shell behavior
# --------------------------------------------------
shopt -s checkwinsize

# Enable ** globbing (optional, comment out if you don’t want it)
# shopt -s globstar

# --------------------------------------------------
# less improvements (if installed)
# --------------------------------------------------
if command -v lesspipe.sh >/dev/null 2>&1; then
    eval "$(lesspipe.sh)"
fi

# --------------------------------------------------
# Prompt
# --------------------------------------------------
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes ;;
esac

if [[ $color_prompt == yes ]]; then
    PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt

# Set terminal title for xterm-compatible terminals
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
esac

# --------------------------------------------------
# Colors & aliases
# --------------------------------------------------
if command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Desktop notification for long commands
alias alert='notify-send --urgency=low \
    -i "$([ $? = 0 ] && echo terminal || echo error)" \
    "$(history | tail -n1 | sed -e "s/^[[:space:]]*[0-9]\+[[:space:]]*//")"'

# --------------------------------------------------
# User aliases
# --------------------------------------------------
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

# --------------------------------------------------
# Bash completion (Arch path)
# --------------------------------------------------
if ! shopt -oq posix; then
    [[ -f /usr/share/bash-completion/bash_completion ]] &&
        source /usr/share/bash-completion/bash_completion
fi

# --------------------------------------------------
# Node Version Manager
# --------------------------------------------------
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

# --------------------------------------------------
# Google Cloud CLI
# --------------------------------------------------
[[ -f /etc/profile.d/google-cloud-cli.sh ]] &&
    source /etc/profile.d/google-cloud-cli.sh
