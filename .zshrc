# Disable keyboard input
#stty -echo
# Created by newuser for 5.9


# The following lines were added by compinstall
if [[ ! -f /etc/NIXOS ]] then
zstyle ':completion:*' file-sort access
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/fish/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=500
unsetopt beep
bindkey -v
fi
# End of lines configured by zsh-newuser-install


#neofetch || fastfetch
fastfetch
# AUTOLOADS
#autoload -Uz colors && colors


zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# ALIASES
alias wifi-qr='nmcli device wifi show-password'
alias rm='trash-put'
alias rmfr='trash-rm'
alias cat='bat'
alias cls='clear'
alias cp='cp -i'
alias grep='grep --color=auto'
alias clear='clear; source ~/.zshrc'
alias eri='nvim ~/.config/niri/config.kdl'
# alias ls='ls -g --group-directories-first --color=auto'
alias ls='eza'
alias vi='nvim'
alias nvi='nvim'
alias vim='nvim'
alias shitfuck='sudo dmesg -l emerg,alert,crit,err'
alias runningp='sudo ss -tulnp'
# OPTS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt extended_glob
setopt autocd


if [[ ! -f /etc/NIXOS ]] then
# EXPORTS
ZSH_DIRS=(/usr/share/zsh $HOME/.zsh)
# FUNCTIONS

load() {
    local namespace="$1"
    local name="$2"
    local ext="$3"
    local pattern
    local match

    for dir in "${ZSH_DIRS[@]}"; do
        pattern="${dir}/${namespace}/**/${name}${ext}"
        # Use recursive globbing with glob qualifiers
        for match in ${~pattern}(N); do
        if [[ -f "$match" ]]; then
            source "$match"
            return 0
        fi
        done
    done

    echo "'${name}${ext}' not found in any ${namespace}/ directory." >&2
    return 1
}

loadplugin() {
    local name="$1"
    load plugins "$name" ".plugin.zsh"
    return $?
}
loadtheme() {
    local name="$1"
    load themes "$name" ".zsh-theme"
    return $?
}

# PLUGINS
loadplugin zsh-autosuggestions
loadplugin zsh-syntax-highlighting

source <(fzf --zsh)
#fpath=($ZSH/plugins/zsh-completions/src $fpath)
eval "$(starship init zsh)"

fi
#stty echo
