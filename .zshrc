# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Prompt Settings {{{
#
PROMPT='%F{magenta}%1~%f%F{cyan}$%f '
## Git Settings
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b) %r%f'
zstyle ':vcs_info:*' enable git
# }}}

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/history

# Options
#
setopt NO_HIST_IGNORE_ALL_DUPS # don't filter non-contiguous duplicates from history
setopt HIST_FIND_NO_DUPS       # don't show dupes when searching
setopt HIST_IGNORE_DUPS        # do filter contiguous duplicates from history
setopt HIST_IGNORE_SPACE       # [default] don't record commands starting with a space
setopt HIST_VERIFY             # confirm history expansion (!$, !!, !foo)
setopt SHARE_HISTORY           # share history across shells

setopt AUTO_CD                 # [default] .. is shortcut for cd .. (etc)
setopt AUTO_PARAM_SLASH        # tab completing directory appends a slash
# setopt CORRECT                 # [default] command auto-correction
# setopt CORRECT_ALL             # [default] argument auto-correction

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc"

#
# Prompt
#

# aliases
alias ...='cd ../..'
alias ~='cd ~'
alias ls='ls --color=auto'
alias la='ls --color=auto -a'
alias lha='ls --color=auto -lha'
alias lh='ls --color=auto -lh'
alias ll='ls --color=auto -l'
alias rmrf='rm -rf'
alias df='df -h'
alias z='zathura'
alias s='sxiv'
alias n='newsboat'
alias t='tmux -u a || tmux -u'

# alias o='xdg-open "$(find -type f | fzf)"'
function o() {
  if [[ "$#" > 0 ]]; then
    xdg-open "$@"
  else
    xdg-open "$(find -type f | fzf)"
  fi
}

alias fd='cd $(find . -maxdepth 3 -type d | fzf)'
alias fdh='cd $(find ~ -maxdepth 3 -type d | fzf)'
# alias frm='find . -maxdepth 1 -type f | fzf -m | tr \\n \\0 | xargs -0 rm'
# alias frm='for file in $(find . -maxdepth 1 -type f | fzf -m); do echo $file; done'

function mcd() {
  mkdir -p $1 && cd $1
}

function cht() {
  curl -s "cheat.sh/${1}" | less -R
}

alias p='sudo pacman'
alias td='transmission-daemon'
alias ydl='youtube-dl'

alias sub='qnapi -c -l en'

alias preview='tsp mpv --ontop --no-border --force-window --autofit=500x280 --geometry=-15-60 '

alias myip="ip -4 a | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1'"
alias htmllint="python -c 'import sys; import xml.dom.minidom; s=sys.stdin.read(); print(xml.dom.minidom.parseString(s).toprettyxml())'"
alias serve='browser-sync start --server --files . --no-notify --port 9000'
alias serve-out='browser-sync start --server --files . --no-notify --host $(hostname -I) --port 9000'
alias cfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# make fugitive work with bare repo https://stackoverflow.com/a/66624354
alias cfge='cd && GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME nvim -c "G"'

function g() {
  if [[ "$#" > 0 ]]; then
    git "$@"
  else
    git status -sb
  fi
}

function e() {
  to_open=${1:-`pwd`}
  if [[ -d "$to_open" ]]; then
    # open session if Session.vim exists in given directory.
    if [[ -f "$to_open/Session.vim" ]]; then
      $EDITOR -S "$to_open/Session.vim"
    else
      # change the vim root directory to given
      # path (so that fzf, etc works correctly).
      # nvim "$to_open" -c "cd $to_open"
      cd "$to_open" && $EDITOR .
    fi
  else
    nvim $to_open
  fi
}

alias se='nvim -c ":argadd $(cfg ls-tree --full-tree --name-only -r HEAD | tr \"\n\" \" \")"'

# git aliases https://catonmat.net/git-aliases
# alias g='git status -sb'
alias ga='git add'
alias gl='git log'
alias gpsh='git push'
# push current branch to remote
alias gpshup='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gpl='git pull'
alias gd='git diff'
alias gm='git commit -m'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gcl='git clone'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Enable a better reverse search experience.
#   Requires: https://github.com/junegunn/fzf (to use fzf in general)
#   Requires: https://github.com/BurntSushi/ripgrep (for using rg below)
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# history search fzf widget
# references: https://github.com/gotbletu/dotfiles_v2/blob/master/normal_user/zshrc/.zshrc#L336
fzf-history-widget() {
  local selected
  if selected=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf -q "$LBUFFER" +s -e -i --tac --height 10% | sed 's/ *[0-9*]* *//' ); then
    LBUFFER=$selected
  fi
  zle redisplay
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget

# https://github.com/zsh-users/zsh-autosuggestions.git
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59'

# Load syntax highlighting; should be last.
# https://github.com/zdharma/fast-syntax-highlighting
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
