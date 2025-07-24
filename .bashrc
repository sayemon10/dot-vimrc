# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
unset HISTFILE

# Source the official Git prompt script
# This path was found using 'find /usr/share/doc/git -name git-prompt.sh'
if [ -f /usr/share/doc/git/contrib/completion/git-prompt.sh ]; then
  . /usr/share/doc/git/contrib/completion/git-prompt.sh
fi

# Optional: Configure __git_ps1 to show more info
GIT_PS1_SHOWDIRTYSTATE=true       # Show '*' for dirty, '+' for staged
GIT_PS1_SHOWUNTRACKEDFILES=true   # Show '%' for untracked files
GIT_PS1_SHOWSTASHSTATE=true       # Show '$' for stashed changes
GIT_PS1_SHOWUPSTREAM="auto"       # Show 'ahead N', 'behind N', 'diverged' etc.
GIT_PS1_SHOWCOLORHINTS=true       # Add colors to the output of __git_ps1

# Customize your PS1 to include the Git branch
# This example adds the branch in parentheses and removes the username
# and combines it with your previous desired prompt (fedora:~/current/dir$)
export PS1='\[\033[0;32m\]fedora:\w\[\033[0m\]$(__git_ps1 " (\[\033[0;36m\]%s\[\033[0m\])")\$ '
# If you want color for the Git branch, ensure GIT_PS1_SHOWCOLORHINTS is enabled
# and your terminal supports colors.
# Example with colors for directory and git branch:
# export PS1='\[\033[0;34m\]fedora:\w\[\033[0m\]$(__git_ps1 " (\[\033[0;33m\]%s\[\033[0m\])")\$ '
# The above is more complex due to nested color codes. Keep it simple first.

# Powerline
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi 
