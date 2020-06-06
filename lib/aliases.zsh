# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'
alias ..='cd ..'

# Super user
alias _='sudo'

# Show history
alias history='fc -l 1'

####################
#fork from .bashrc #
####################

# modified commands
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'

# new commands
alias da='date "+%A, %B %d, %Y [%T] %Z"'
alias hist='history | grep $1'      # requires an argument

# privileged access
if [ $UID -ne 0 ]; then
alias sudo='sudo '
alias scat='sudo cat'
alias svim='sudo vim'
#alias emacs='open -a emacs "$@"'
alias e='emacsclient -n'
alias root='sudo su'
alias reboot='sudo reboot'
alias halt='sudo halt'
alias update='sudo pacman -Su'
alias netcfg='sudo netcfg2'
fi

# ls
alias ls='ls -G'
alias lr='ls -r'                    # recursive ls
alias ll='ls -l'
alias la='ll -a'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
alias lsa='ls -lah'
alias ll='ls -l'
alias sl=ls # often screw this up

# safety features
alias cp='cp -v'
# show progress when copying
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"
alias mv='mv -i -v'
alias ln='ln -i'
#python 2to3
alias pserver='python -m SimpleHTTPServer'

alias bububc='brew update && brew upgrade && brew clean'

#alias for todo.txt
function todo(){
  if [ $# -eq 0 ];then
    sh ~/bin/todo.sh ls
  else
    sh ~/bin/todo.sh $*
  fi
}

function zsh_stats() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head
}

function take() {
  mkdir -p $1
    cd $1
}

# function for extract
function x() {
  unset REMOVE_ARCHIVE

    if test "$1" = "-r"; then
      REMOVE=1
        shift
        fi
        if [[ -f $1 ]]; then
          case $1 in
            *.tar.bz2) tar xvjf $1;;
  *.tar.gz) tar xvzf $1;;
  *.tar.xz) tar xvJf $1;;
  *.tar.lzma) tar --lzma -xvf $1;;
  *.bz2) bunzip $1;;
  *.rar) unrar $1;;
  *.gz) gunzip $1;;
  *.tar) tar xvf $1;;
  *.tbz2) tar xvjf $1;;
  *.tgz) tar xvzf $1;;
  *.zip) unzip $1;;
  *.Z) uncompress $1;;
  *.7z) 7z x $1;;
  *) echo "'$1' cannot be extracted via >extract<";;
  esac

    if [[ $REMOVE_ARCHIVE -eq 1 ]]; then
      echo removing "$1";
  /bin/rm "$1";
  fi

    else
      echo "'$1' is not a valid file"
        fi
}

alias c='remind -w$(tput cols) -mc+lc2 ~/.reminders'

#uninstall Xcode
alias uninstallxcode='sudo /Developer/Library/uninstall-devtools --mode=all'

# Git alias
alias gst='git status'
alias gl='git log'
alias glp='git log -p'

############
# bundler
############

alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bu="bundle update"
alias bp="bundle package"
alias qor="cd ~/Project/qor/"
alias github="cd ~/Project/github/"
alias cap="bundle exec cap"
alias sb='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias mux="tmuxinator"
alias ehost="sudo vim /etc/hosts"

### TMUX
alias tma='tmux attach -d -t'

## UTILS
alias weather='curl -4 http://wttr.in'

alias kafkacat='docker run ryane/kafkacat'

alias bzb='bazel build'
alias bzr='bazel run'
alias bzt='bazel test --test_output=errors'
alias klog='stern'
alias sha256sum="shasum -a 256"
