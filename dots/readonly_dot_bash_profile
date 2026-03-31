[[ -f "$HOME/.profile" ]] && source "$HOME/.profile"
[[ -f "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

if [[ -z "$DISPLAY" ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
    if pgrep -u "$USER" -x niri >/dev/null 2>&1; then
        echo "A niri session is already running."; sleep 5
    else
        export TERMINAL="$NIRI_APP_TERMINAL"
        export BROWSER="$NIRI_APP_BROWSER"
        exec systemd-cat -t niri -- niri --session
    fi
fi
