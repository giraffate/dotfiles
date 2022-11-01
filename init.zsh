export DOTFILES_DIR="$HOME/dotfiles"

# Alias
source $DOTFILES_DIR/alias.zsh

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
# NodeJS
export PATH="$HOME/.nodebrew/current/bin:$PATH"
# Go
export PATH="/usr/local/go/bin:$PATH"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

fpath+=~/.zfunc
autoload -U compinit; compinit
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 1000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-pushd true

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort --query "$LBUFFER")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^x^r' select-history

function fzf-find-file() {
    if git rev-parse 2> /dev/null; then
        source_files=$(git ls-files)
    else
        source_files=$(find . -type f)
    fi
    selected_files=$(echo $source_files | fzf --prompt "[find file]")

    BUFFER="${BUFFER}`echo $selected_files | tr '\n' ' '`"
    CURSOR=$#BUFFER
}
zle -N fzf-find-file
bindkey '^x^f' fzf-find-file