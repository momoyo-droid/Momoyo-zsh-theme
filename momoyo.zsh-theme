# emojis
right_triangle(){
   echo $'\ue0b0'
}

prompt_indicator(){
   echo $'%B\u276f%b'
}

# arrow username
arrow_start(){
    echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end(){
    echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}"
}

# username colors
username(){
    ARROW_FG="016" # black color letter
    ARROW_BG="182" # purple bg
    NEXT_ARROW_BG="139" # next bg 
    NEXT_ARROW_FG="182" # next arrow
    echo "$(arrow_start) %n $(arrow_end)"
}

# directory levels
directory(){
    ARROW_FG="016"
    ARROW_BG="139"
    NEXT_ARROW_BG="015"
    NEXT_ARROW_FG="139"
    echo "$(arrow_start) %3~ $(arrow_end)"
}

# current time with milliseconds
current_time(){
    echo "⌛ %U%B %* %D %b%u"
}

# returns x if there are errors, nothing otherwise
return_status(){
    echo " %(?.✔.%{$fg[red]%}✘%f)"
}

git_prompt(){
   ARROW_FG="016"
   ARROW_BG="139"
   NEXT_ARROW_BG=""
   NEXT_ARROW_FG="096"
   echo "$(arrow_start) $(git_prompt_info) $(arrow_end)"
}

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} 📋%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} 🗑️%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ✍️%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"

# putting it all together
PROMPT='$(username)$(directory) 
$(prompt_indicator)$(prompt_indicator) '
RPROMPT='$(git_prompt_status) $(current_time)$(return_status)'