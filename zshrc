#source ~/.bash_profile
export LC_ALL=C
# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# Path
#export PATH=/opt/vc/bin:~/bin:$PATH
# Setting ZSH_THEME
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
PROMPT='%{$fg[$NCOLOR]%}%n@%m: %c$ %{$reset_color%}'
RPROMPT='%{$fg[$NCOLOR]%}%p $(git_prompt_info)%{$reset_color%}'

# Load custom files
source "/home/lenage/.zsh/lib/git.zsh"
source "/home/lenage/.zsh/lib/completion.zsh"


# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vi

# aliases
if [ -e "$HOME/.zsh/aliases" ]; then
  source "$HOME/.zsh/aliases"
fi

#use emacs keybinding
bindkey -e

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
# bindkey "^A" beginning-of-line
# bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
#export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt correct_all
# Enable extended globbing
setopt EXTENDED_GLOB

# Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T '

setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space

setopt SHARE_HISTORY
setopt APPEND_HISTORY

## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER=less
export LC_CTYPE=en_US.UTF-8
ulimit -s unlimited

# TMUX
#if which tmux 2>&1 >/dev/null; then
    #if not inside a tmux session, and if no session is started, start a new session
#    test -z "$TMUX" && (tmux attach || tmux new-session)
#fi
