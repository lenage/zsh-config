source ~/.bash_profile
# load our own completion functions
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/completion $fpath)

# Path
export ANDROID_HOME="$HOME/Vendor/Android/sdk"
export GOPATH=$HOME/Project/golang
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
ANDROIDPATH="$HOME/Vendor/Android/sdk/tools:$HOME/Vendor/Android/sdk/platform-tools"
export PATH="$ANDROIDPATH:$HOME/Library/Haskell/bin:/Users/lenage/bin:/usr/local/sbin:/usr/local/bin:/Users/lenage/Project/golang/bin:$PATH";
#export PATH="$HOME/Library/Haskell/bin:/Users/lenage/bin:/usr/local/sbin:/usr/local/bin:/Users/lenage/Project/golang/bin:$PATH";
# Setting ZSH_THEME
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi

#PROMPT='%{$fg[$NCOLOR]%}%c 🚴  %{$reset_color%}'
PROMPT='%{$fg[$NCOLOR]%}%c $ %{$reset_color%}'
RPROMPT='%{$fg[$NCOLOR]%}%p $(git_prompt_info)%{$reset_color%}'

# Load git functions
source "/Users/lenage/.zsh/lib/git.zsh"
source "/Users/lenage/.zsh/lib/completion.zsh"
source "/Users/lenage/.zsh/lib/gpg-agent.zsh"

# Load custom files
source "/Users/lenage/.zsh/custom/lenage.zsh"
source "/Users/lenage/.zsh/custom/project.zsh"

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
### Added by the SMLNG 110.75
export PATH="/usr/local/smlnj-110.75/bin:$PATH"
### add node PATH
export PATH="/usr/local/share/npm/bin:$PATH"
