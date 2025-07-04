# ============================================================
#   Aliases
# ============================================================

alias pip=pip3

# ============================================================
#   Exports - General
# ============================================================

# set the locale of the shell
export LANG="en_US.UTF-8"

# define VSCode as the default text editor
export EDITOR="code -w"

# specify characters considered as word boundaries for command line navigation
export WORDCHARS=""

# set the location and filename of the history file
export HISTFILE="$HOME/.zsh_history"

# set the maximum number of lines to be saved in the history file
export HISTSIZE="10000"
export SAVEHIST="$HISTSIZE"

# fzf parameters used in all widgets - configure layout and wrapped the preview results (useful in large command rendering)
export FZF_DEFAULT_OPTS="--height 100% --layout reverse --preview-window=wrap"

# CTRL + R: put the selected history command in the preview window - "{}" will be replaced by item selected in fzf execution runtime
export FZF_CTRL_R_OPTS="--preview 'echo {}'"

# CTRL + T: set "fd-find" as search engine instead of "find" and exclude .git for the results
export FZF_CTRL_T_COMMAND="fd --exclude .git --ignore-file $HOME/.my-custom-zsh/.fd-fzf-ignore"

# CTRL + T: put the file content if item select is a file, or put tree command output if item selected is directory
export FZF_CTRL_T_OPTS="--preview '[ -d {} ] && tree -C {} || bat --color=always --style=numbers {}'"

# set the location of the starship configuration file
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# ============================================================
#   Export - PATH Variable
# ============================================================

# apple internal binaries
export PATH="/System/Cryptexes/App/usr/bin"
export PATH="$PATH:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin"
export PATH="$PATH:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin"
export PATH="$PATH:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"

# include user-specific binaries and scripts
export PATH="$PATH:$HOME/.local/bin"

# add Rust binaries to the PATH
export PATH="$PATH:$HOME/.cargo/bin"

# include user-specific binaries and scripts
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:/opt/homebrew/sbin"

# system wide cli
export PATH="$PATH:/sbin"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/local/bin"

# python cli
export PATH="$PATH:$HOME/.venv/bin"

# ============================================================
#   Options and Key Bindings
# ============================================================

# disable CTRL + S and CTRL + Q
stty -ixon

# enable comments "#" expressions in the prompt shell
setopt INTERACTIVE_COMMENTS

# append new history entries to the history file
setopt APPEND_HISTORY

# save each command to the history file as soon as it is executed
setopt INC_APPEND_HISTORY

# ignore recording duplicate consecutive commands in the history
setopt HIST_IGNORE_DUPS

# ignore commands that start with a space in the history
setopt HIST_IGNORE_SPACE

# use the ZLE (zsh line editor) in emacs mode. Useful to move the cursor in large commands
bindkey -e

# # navigate words using Ctrl + arrow keys
# # >>> CRTL + right arrow | CRTL + left arrow
# bindkey "^[[1;5C" forward-word
# bindkey "^[[1;5D" backward-word

# macosx override
if [[ "$OSTYPE" == "darwin"* ]]; then 
    # >>> OPT + right arrow | OPT + left arrow
    bindkey "^[^[[C" forward-word
    bindkey "^[^[[D" backward-word
fi

# search history using Up and Down keys
# >>> up arrow | down arrow
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# jump to the start and end of the command line
# >>> CTRL + A | CTRL + E
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
# >>> Home | End
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# navigate menu for command output
zstyle ':completion:*:*:*:*:*' menu select
bindkey '^[[Z' reverse-menu-complete

# delete characters using the "delete" key
bindkey "^[[3~" delete-char

# fzf alias: CTRL + SPACE (gadget parameters configured in the FZF_CTRL_T_COMMAND environment variable)
bindkey "^@" fzf-file-widget

# ============================================================
#   Plugins
# ============================================================

# load zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$HOME/.my-custom-zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# load zsh-syntax-highlighting
source "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.my-custom-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# load fzf keybindings and completions
eval "$(fzf --zsh)"

# load starship prompt
eval "$(starship init zsh)"