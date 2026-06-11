if status is-interactive
    set -g fish_greeting

    alias rm="echo 'Using trash-cli instead!'; false"
    alias tree='tree -C'
    alias lg=lazygit

    starship init fish | source
    fzf --fish | source
end
