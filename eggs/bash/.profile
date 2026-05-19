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

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export MANPAGER='nvim +Man!'

if [[ -z "$DISPLAY" ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
    if pgrep -u "$USER" -x niri >/dev/null 2>&1; then
        echo "A niri session is already running."; sleep 5
    else
        exec systemd-cat -t niri -- niri --session
    fi
fi
