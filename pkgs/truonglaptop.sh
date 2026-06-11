packages=(
    base base-devel linux linux-headers linux-zen linux-zen-headers
    linux-firmware sof-firmware amd-ucode efibootmgr grub terminus-font
    pacman pacman-contrib yay rate-mirrors

    # network & bluetooth
    networkmanager openssh zapret2 bluez bluez-utils

    # audio (pipewire)
    rtkit pipewire pipewire-audio wireplumber
    pipewire-alsa pipewire-pulse pipewire-jack

    # graphics drivers
    mesa mesa-utils vulkan-icd-loader vulkan-tools vulkan-radeon
    lib32-mesa lib32-vulkan-icd-loader lib32-vulkan-radeon
    nvidia-open-dkms nvidia-utils nvidia-prime lib32-nvidia-utils

    # clis
    bash bash-completion fish git git-lfs lazygit neovim neovim-symlinks man-db
    starship fzf chezmoi less tree ripgrep jq htop nvtop gdu
    trash-cli xdg-utils xdg-user-dirs xdg-sound wl-clipboard

    # window manager (niri)
    greetd greetd-tuigreet uwsm niri xwayland-satellite
    xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr
    quickshell qml-niri brightnessctl playerctl
    ## looks & feel
    noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-liberation ttf-0xproto-nerd
    bibata-cursor-theme-bin papirus-icon-theme
    adw-gtk-theme glib2 dconf # GTK
    qt6ct-kde qt5ct-kde # Qt
    ## programs
    fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool fcitx5-bamboo
    kitty firefox nemo
)

services=()
