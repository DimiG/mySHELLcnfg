################################################################################
# File        : .zshrc                                                         #
# Created by  : DG                                                             #
# Date        : 2024-10-30                                                     #
# Description : This ZSH configuration file for Arch Lnx                       #
################################################################################

# Load colors
autoload -U colors && colors

# Set Variables
for color in red green yellow blue magenta cyan black white; do
  eval $color='%{$fg_no_bold[${color}]%}'
done

reset="%{$reset_color%}"

host="${yellow}%m"

# Start Init
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

# Load promptinit
autoload -Uz promptinit && promptinit

# Define the theme
setopt PROMPT_SUBST

prompt_dgtheme_setup() {
  PROMPT='${green}[${host}${green}][${magenta}%~${green}${vcs_info_msg_0_}]${reset} '
}

# Add the theme to promptsys
prompt_themes+=( dgtheme )

# Load the theme
prompt dgtheme

# Command completion
# zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Set options
setopt autocd

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------

# Some people use a different file for aliases
if [ -f "${HOME}/.zaliases" ]; then
  source "${HOME}/.zaliases"
fi

# ------------------------------------------------------------------------------
# Key bindings
# ------------------------------------------------------------------------------

# Home, End and Delete Keys Enable
bindkey "^[[H"    beginning-of-line
bindkey "^[[F"    end-of-line
bindkey "^[[3~"   delete-char
bindkey "^[[5~"   up-line-or-history
bindkey "^[[6~"   down-line-or-history
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# ------------------------------------------------------------------------------
# History search
# ------------------------------------------------------------------------------
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Configuring $PATH
typeset -U path PATH
path=(~/.local/bin $path)
export PATH

# ------------------------------------------------------------------------------
# etc...
# ------------------------------------------------------------------------------

unset HISTFILE
