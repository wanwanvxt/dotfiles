_aur_helper="yay"
_packages=(
    # base
    "base"
    "base-devel"
    "linux"
    "linux-firmware"
    "sof-firmware"
    "efibootmgr"
    "grub"
    "zram-generator"
    "yay-bin"
    "pacman-contrib"

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
    "nvidia-open"
    "nvidia-utils"
    "nvidia-prime"
    "lib32-nvidia-utils"

    # misc
    "gnome-keyring"

    # shells
    "bash"
    "bash-completion"
    "bash-language-server"
    "fish"
    "fish-lsp"
    "starship"
    "fzf"

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
    "wireplumber"
    "playerctl"
    "brightnessctl"
    "wl-clipboard"
    "libnotify"
    "slurp"
    "grim"

    # hyprland
    "hyprland"
    "hyprpaper"

    # ime
    "fcitx5"
    "fcitx5-configtool"
    "fcitx5-bamboo"

    # dotfiles
    "chezmoi"

    # cli utils
    "less"
    "tree"
    "libnotify"

    # apps
    ## editors
    "helix"
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
    "btop"
    "rocm-smi-lib" # btop - AMD GPU support
    "nvtop"

    # gaming
    "steam"
    "gamemode"
    "lib32-gamemode"

    # developments
    "gcc"
    "clang"
    "cmake"
    "xmake"
    "python"
    "python-pip"
    "ruff"
    "odin"
    "odinls-bin"
    "odinfmt"
    "rust"
    "rust-analyzer"
)
