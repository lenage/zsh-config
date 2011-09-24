# ZSH Theme 
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi


local return_code="%(?..%{$fg[green]%}%? ↵%{$reset_color%})"


#local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
#local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
#local rvm_ruby='%{$fg[red]%}‹$(~/.rvm/bin/rvm-prompt i v g)›%{$reset_color%}'
#local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT='%{$fg[$NCOLOR]%}%c $(git_prompt_info)\
%{$fg[green]%}%(!.#.➤)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=""
