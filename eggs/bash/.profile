export PATH="$HOME/.local/bin:$PATH"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

if [[ -f "$HOME/.config/user-dirs.dirs" ]]; then
    set -a
    source "$HOME/.config/user-dirs.dirs"
    set +a
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export MANPAGER='nvim +Man!'

export NIRI_APP_TERMINAL='kitty -1'
export NIRI_APP_FILE_MANAGER=thunar
export NIRI_APP_BROWSER=firefox
export NIRI_APP_TASK_MANAGER=tux-manager

if [[ -z "$DISPLAY" ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
    if pgrep -u "$USER" -x niri >/dev/null 2>&1; then
        echo "A niri session is already running."; sleep 5
    else
        export TERMINAL="$NIRI_APP_TERMINAL"
        export BROWSER="$NIRI_APP_BROWSER"
        exec systemd-cat -t niri -- niri --session
    fi
fi
