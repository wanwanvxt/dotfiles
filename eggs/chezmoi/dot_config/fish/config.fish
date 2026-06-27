if status is-interactive
    set -g fish_greeting

    alias la='ls --color=auto -lAh'
    alias ls='ls --color=auto'
    alias tree='tree -C'
    alias grep='grep --color=auto'
    alias rm="echo 'Using trash-cli instead!'; false"
    alias lg=lazygit

    starship init fish | source
    fzf --fish | source
end
