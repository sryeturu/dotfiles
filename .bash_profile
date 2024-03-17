# ~/.bash_profile: executed by Bash for login shells.

# Source .bashrc for interactive shell settings
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Initialize Pyenv if available
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# Set PATH to include user's private bins
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
# Adding Flameshot custom build path
PATH="$HOME/flameshot/build/src:$PATH"

export PATH
