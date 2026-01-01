#!/bin/env bash

C_RESET='\033[0m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_YELLOW='\033[0;33m'
C_BLUE='\033[0;34m'
C_CYAN='\033[0;36m'
C_BOLD='\033[1m'

echo -e "${C_BOLD}${C_CYAN}--- Arch Linux package installer ---${C_RESET}"

_current_hostname=$(hostnamectl hostname)
read -p ">> Enter host name (Default: $_current_hostname): " _hostname
_hostname=${_hostname:-$_current_hostname}

# aur helper support pacman flag options (yay, paru, etc.)
_aur_helper=""
_packages=(
    "base"
    "linux"
    "linux-firmware"
)

_script_dir=$(readlink -f "$(dirname "$0")")
_config_file="$_script_dir/pkgs/$_hostname.sh"

if [[ ! -f "$_config_file" ]]; then
    echo -e ${C_RED}"Config file '$_config_file' not found.${C_RESET}"
    exit 1
fi

source "$_config_file"

if [[ -n "${_aur_helper:-}" ]]; then
    _pacman="$_aur_helper"
else
    _pacman="sudo pacman"
fi

### --- install ---
echo -e "${C_BLUE}>> Installing packages...${C_RESET}"
$_pacman -S --needed "${_packages[@]}"

### --- enforce explicit ---
echo -e "${C_BLUE}>> Adding defined packages to explicit collections...${C_RESET}"
$_pacman -D --asexplicit "${_packages[@]}"

### --- downgrade to deps ---
mapfile -t _pkgs_explicit < <($_pacman -Qqe)

declare -A _pkgs_wanted
for _pkg in "${_packages[@]}"; do
    _pkgs_wanted["$_pkg"]=1
done

_pkgs_to_asdeps=()
for _pkg in "${_pkgs_explicit[@]}"; do
    [[ -z "${_pkgs_wanted[$_pkg]+x}" ]] && _pkgs_to_asdeps+=("$_pkg")
done

if [[ ${#_pkgs_to_asdeps[@]} -gt 0 ]]; then
    echo -e "${C_BLUE}>> Downgrading extra explicit packages to deps...${C_RESET}"
    echo -e "${C_BLUE}>> These packages will be removed from explicit collection (downgrade to deps): ${C_RESET}${_pkgs_to_asdeps[@]}"
    read -rp ">> Continue? [yes/NO]: " _confirm

    _confirm="$(echo "$_confirm" | tr '[:upper:]' '[:lower:]')"

    if [[ "$_confirm" == "yes" ]]; then
        $_pacman -D --asdeps "${_pkgs_to_asdeps[@]}"
        echo -e "${C_GREEN}>> Packages removed.${C_RESET}"
    else
        echo -e "${C_YELLOW}>> Aborted.${C_RESET}"
    fi
fi

### --- DONE ---
echo -e "${C_BOLD}${C_GREEN}--- DONE!!! ---${C_RESET}"
