if status is-interactive
    set -g fish_greeting

    alias rm="echo 'YOU SHOULD NOT USE THIS COMMAND.'; false"
    alias hx='helix'
    alias lg='lazygit'

    fzf --fish | source
    starship init fish | source
end
