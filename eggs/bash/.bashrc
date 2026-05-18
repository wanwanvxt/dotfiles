[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fzf='fzf --border --highlight-line'
alias rm="echo 'YOU SHOULD NOT USE THIS COMMAND.'; false"
alias vim='nvim'
alias vi='nvim'
alias lg='lazygit'

eval "$(fzf --bash)"

PS1='\[\e[1;32m\]\u\[\e[m\]@\[\e[1;33m\]\h\[\e[m\]:\[\e[1;34m\]\W\[\e[m\] \$ '
