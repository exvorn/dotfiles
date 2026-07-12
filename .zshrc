# Maintained by exvorn (Jovan Bogovac)
# https://github.com/exvorn/dotfiles

# Compinit 24h cache - requires extendedglob for the #q qualifier
autoload -Uz compinit
setopt EXTENDED_GLOB

if [[ -n ~/.zcompdump*(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# Optimized Completion System
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' accept-exact true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' sort false

# Better History Management
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt PROMPT_SUBST

# Git prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%F{red}(%b)%f '

# Runs before every prompt display
precmd() { vcs_info }

# Prompt
PROMPT='%F{blue}%n%F{green}@%F{blue}%m%F{green}:%F{blue}%~ ${vcs_info_msg_0_}%(?.%F{green}.%F{red})%#%f '

# Environment variables
export VIRTUAL_ENV_DISABLE_PROMPT=1 # Disable python venv prompt
export PATH="$HOME/.local/bin:$PATH"

# Lazy loading for external scripts
# Node Version Manager
nvm() {
    unset -f nvm
    source /usr/share/nvm/init-nvm.sh
    nvm "$@"
}

# Python version manager
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
[[ -d "$PYENV_ROOT/shims" ]] && export PATH="$PYENV_ROOT/shims:$PATH"

pyenv() {
    unset -f pyenv
    
    if command -v pyenv >/dev/null 2>&1; then
        eval "$(command pyenv init -)"
        pyenv "$@"
    else
        echo "pyenv not found in $PYENV_ROOT/bin" >&2
        return 127
    fi
}

# Aliases
alias ls='lsd -a'
alias clip='wl-copy'
alias firefox='firefox-developer-edition'
alias lock='hyprlock 1>/dev/null'
alias feh='kitty +kitten icat'
alias ssh='TERM=xterm ssh'

# Extract helper function
extract() {
    if [[ -z "$1" ]]; then
        echo "Error: No file specified. Usage: extract <archive_file>" >&2
        return 1
    fi

    if [[ ! -f "$1" ]]; then
        echo "Error: File '$1' does not exist or is not a regular file." >&2
        return 1
    fi

    case "$1" in
        *.tar.bz2)   tar xjf "$1"     ;;
        *.tar.gz)    tar xzf "$1"     ;;
        *.bz2)       bunzip2 "$1"     ;;
        *.rar)       unrar x "$1"     ;;
        *.gz)        gunzip "$1"      ;;
        *.tar)       tar xf "$1"      ;;
        *.tbz2)      tar xjf "$1"     ;;
        *.tgz)       tar xzf "$1"     ;;
        *.zip)       unzip "$1"       ;;
        *.Z)         uncompress "$1"  ;;
        *.7z)        7z x "$1"        ;;
        *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
}

# Better key bindings
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^R' history-incremental-search-backward
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# pnpm
export PNPM_HOME="/home/exvorn/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
