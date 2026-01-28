_aur_helper="yay"
_packages=(
    # base
    "base"
    "base-devel"
    "linux"
    "linux-headers"
    "linux-cachyos-bore"
    "linux-cachyos-bore-headers"
    "linux-firmware"
    "sof-firmware"
    "btrfs-progs"
    "efibootmgr"
    "grub"
    "zram-generator"
    "pacman"
    "pacman-contrib"
    "yay"
    "cachyos-keyring"
    "cachyos-mirrorlist"
    "cachyos-v3-mirrorlist"
    "cachyos-v4-mirrorlist"

    # shells
    "bash"
    "bash-completion"
    "fish"
    "starship"
    "fzf"

    # network
    "networkmanager"

    # audio
    "rtkit"
    "pipewire"
    "pipewire-audio"
    "pipewire-alsa"
    "pipewire-pulse"
    "pipewire-jack"
    "lib32-pipewire"

    # bluetooth
    "bluez"
    "bluez-utils"

    # graphics
    "mesa"
    "mesa-utils"
    "vulkan-icd-loader"
    "vulkan-tools"
    "lib32-mesa"
    "lib32-vulkan-icd-loader"
    ## amd
    "vulkan-radeon"
    "lib32-vulkan-radeon"
    ## nvidia
    "nvidia-open-dkms"
    "nvidia-utils"
    "nvidia-prime"
    "lib32-nvidia-utils"

    # misc
    "gnome-keyring"

    # vcs
    "git"
    "lazygit"
    "openssh"

    # xdg
    "xdg-utils"
    "xdg-user-dirs"
    "xdg-desktop-portal"
    "xdg-desktop-portal-gtk"
    "xdg-desktop-portal-hyprland"

    # gtk & qt
    "gtk3"
    "gtk4"
    "qt5-wayland"
    "qt6-wayland"

    # fonts
    "fontconfig"
    "noto-fonts"
    "noto-fonts-cjk"
    "noto-fonts-emoji"
    "noto-fonts-extra"
    "ttf-liberation"
    "ttf-0xproto-nerd"

    # theme manage
    "qt5ct-kde"
    "qt6ct-kde"
    "kvantum-qt5"
    "kvantum"
    "nwg-look"

    # icons & color schemes
    "bibata-cursor-theme-bin"
    "papirus-icon-theme"
    "materia-gtk-theme"
    "materia-kde"
    "kvantum-theme-materia"

    # cli utils
    "less"
    "tree"
    "jq"

    # hyprland
    "hyprland"
    "hyprpaper"
    "hyprpicker"
    "quickshell"
    "wireplumber"
    "playerctl"
    "brightnessctl"
    "grimblast-git"
    "wl-clipboard"
    "cliphist"
    "libnotify"
    "xorg-xrdb"

    # ime
    "fcitx5"
    "fcitx5-configtool"
    "fcitx5-bamboo"

    # dotfiles
    "chezmoi"

    # apps
    ## editors
    "helix"
    "code"
    ## terminals
    "kitty"
    ## files
    "thunar"
    "gvfs"                     # thunar - trash support, mounting with udisk and remote filesystems
    "thunar-archive-plugin"    # thunar - archive creation and extraction
    "thunar-media-tags-plugin" # thunar - view/edit ID3/OGG tags
    "thunar-volman"            # thunar - removable device management
    "tumbler"                  # thunar - thumbnail previews
    "ffmpegthumbnailer"        # thunar - video thumbnails
    "freetype2"                # thunar - font thumbnails
    "ark"
    "7zip"       # ark - 7Z format support
    "unarchiver" # ark - RAR format support
    "unrar"      # ark - RAR decompression support
    ## browsers
    "firefox"
    ## others
    "vlc"
    "vlc-plugins-all" # vlc - all plugins
    "pqiv"
    "mission-center"
    "btop"
    "nvtop"
    "easyeffects"
    "vesktop-bin"

    # gaming
    "steam"
    "gamemode"
    "lib32-gamemode"
    "protonup-qt"
    "pince"

    # developments
    ## c/cpp
    "gcc"
    "clang"
    "cmake"
    "xmake"
    ## python
    "python"
    "python-pip"
    ## odin
    "odin"
    ## rust
    "rust"
)
