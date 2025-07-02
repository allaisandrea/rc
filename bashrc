# Editor
set -o vi
export EDITOR=/usr/bin/vim

# Prompt
export PS1="\w$ "

# History
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
HISTCONTROL=ignoreboth
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# TMUX
export TERM="screen-256color"

# FZF
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.ignore --nocolor --hidden -g ""'
