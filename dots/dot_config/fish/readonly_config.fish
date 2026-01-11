if status is-interactive
    set -g fish_greeting

    alias hx='helix'
    alias lg='lazygit'

    fzf --fish | source
    starship init fish | source
end
