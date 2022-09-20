# ls
alias ll='ls -lahG'
# grep
alias grep='grep --color=auto'
# git
alias g='git'
alias gbd="git branch --merged | grep -v '*' | xargs git branch -d"
alias gpo="git checkout master && git pull origin && gbd"
alias -g B='`g b | fzf --reverse | sed -e "s/^\*[ ]*//g"`'
# emacs
alias e='emacs'
# fzf
alias fzf='fzf -m --reverse'
# docker
alias d='docker'
alias dc='docker-compose'
# Rust
alias c='cargo'
