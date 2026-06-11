#!/usr/bin/bash

set -euo pipefail

BASEDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)
PACMAN=$(command -v yay || command -v paru || echo 'sudo pacman')

HOST=$(uname -n)
HOST_FILE="$BASEDIR/pkgs/$HOST.sh"

if [[ ! -f "$HOST_FILE" ]]; then
    echo "File '$HOST_FILE' not found!"
    exit 1
fi

packages=()
source "$HOST_FILE"

if [[ "${#packages[@]}" -gt 0 ]]; then
    $PACMAN -S --needed "${packages[@]}"
    $PACMAN -D --asexplicit "${packages[@]}"

    INSTALLED_PKGS=$(pacman -Qeq | sort)
    DEFINED_PKGS=$(printf '%s\n' "${packages[@]}" | sort)

    UNDEFINED_PKGS=$(comm -23 <(echo "$INSTALLED_PKGS") <(echo "$DEFINED_PKGS") | tr '\n' ' ')

    if [[ -n "$UNDEFINED_PKGS" ]]; then
        echo -e '\n\nUndefined packages:'
        echo $UNDEFINED_PKGS

        read -rp '>> Set these undefined packages as non-explicitly? [yes/NO]: ' confirm;
        confirm=$(echo "$confirm" | tr '[:upper:]' '[:lower:]')

        if [[ "$confirm" = 'y' ]] || [[ "$confirm" = 'yes' ]]; then
            $PACMAN -D --asdeps $UNDEFINED_PKGS
        fi
    fi
fi
