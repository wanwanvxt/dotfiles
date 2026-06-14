#!/usr/bin/bash

set -euo pipefail

install_packages() {
    PACMAN=$(command -v yay || command -v paru || echo 'sudo pacman')

    if [[ "${#packages[@]}" -gt 0 ]]; then
        $PACMAN -S --needed "${packages[@]}"
        $PACMAN -D --asexplicit "${packages[@]}"

        INSTALLED_PKGS=$(pacman -Qeq | sort)
        DEFINED_PKGS=$(printf '%s\n' "${packages[@]}" | sort)

        UNDEFINED_PKGS=$(comm -23 <(echo "$INSTALLED_PKGS") <(echo "$DEFINED_PKGS") | tr '\n' ' ')

        if [[ -n "$UNDEFINED_PKGS" ]]; then
            echo -e '\n\nUndefined packages:'
            echo $UNDEFINED_PKGS

            read -rp '>> Set these undefined packages as non-explicitly? [yes/NO]: ' CONFIRM;
            CONFIRM=$(echo "$confirm" | tr '[:upper:]' '[:lower:]')

            if [[ "$CONFIRM" = 'y' ]] || [[ "$CONFIRM" = 'yes' ]]; then
                $PACMAN -D --asdeps $UNDEFINED_PKGS
            fi
        fi
    fi
}

apply_services() {
    for ENTRY in "${services[@]}"; do
        SYSTEMCTL='systemctl'
        ACTION="${ENTRY:0:1}"
        SERVICE="${ENTRY:1}"

        if [[ "$SERVICE" == user:* ]]; then
            SERVICE="${SERVICE#user:}"
            SYSTEMCTL='systemctl --user'
        fi

        if ! $SYSTEMCTL list-unit-files "$SERVICE.service" >/dev/null 2>&1; then
            echo "Service '$SERVICE.service' not found!"
            continue
        fi

        case "$ACTION" in
            +)
                $SYSTEMCTL is-enabled "$SERVICE.service" >/dev/null 2>&1 \
                    || $SYSTEMCTL enable "$SERVICE.service"
                ;;
            -)
                $SYSTEMCTL is-enabled "$SERVICE.service" >/dev/null 2>&1 \
                    && $SYSTEMCTL disable "$SERVICE.service"
                ;;
        esac
    done
}

BASEDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)
HOST=$(uname -n)
PKGS="$BASEDIR/pkgs/$HOST.sh"
PKGS_LOCAL="$BASEDIR/pkgs/$HOST.local.sh"

if [[ ! -f "$PKGS" ]]; then
    echo "File '$PKGS' not found!"
    exit 1
fi

packages=()
services=()
source "$PKGS"
[[ -f "$PKGS_LOCAL" ]] && source "$PKGS_LOCAL"

install_packages
apply_services
