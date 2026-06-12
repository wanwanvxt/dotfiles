packages=(
    base{,-devel} linux{,-headers} linux-zen{,-headers}
    {linux,sof}-firmware amd-ucode efibootmgr grub terminus-font
    pacman{,-contrib} yay rate-mirrors

    # network & bluetooth
    networkmanager openssh zapret2 bluez{,-utils}

    # audio (pipewire)
    rtkit pipewire{,-audio,-alsa,-pulse,-jack} wireplumber

    # graphics drivers
    mesa{,-utils} vulkan-{icd-loader,tools,radeon} nvidia-{open-dkms,utils,prime}
    lib32-{mesa,vulkan-{icd-loader,radeon},nvidia-utils}

    # clis
    bash{,-completion} fish git{,-lfs} lazygit neovim{,-symlinks} man-db
    starship fzf chezmoi less tree ripgrep jq htop nvtop gdu 7zip unrar
    trash-cli xdg-{utils,user-dirs,sound} wl-clipboard

    # window manager (niri)
    greetd{,-tuigreet} uwsm niri xwayland-satellite xdg-desktop-portal{,-gtk,-wlr}
    {quickshell,qml-niri} brightnessctl playerctl
    ## looks & feel
    noto-fonts{,-cjk,-emoji} ttf-{liberation,0xproto-nerd}
    bibata-cursor-theme-bin papirus-icon-theme
    {adw-gtk-theme,glib2,dconf} qt{6,5}ct-kde
    ## programs
    fcitx5{,-gtk,-qt,-configtool,-bamboo} kitty firefox imv mpv
    {thunar{,-archive-plugin,-volman},gvfs,tumbler,ffmpegthumbnailer}
    steam protonplus
)

services=()
