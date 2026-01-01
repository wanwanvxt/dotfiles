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
    "wireplumber"

    # bluetooth
    "bluez"
    "bluez-utils"

    # graphics
    "mesa"
    "mesa-utils"
    "vulkan-icd-loader"
    "vulkan-tools"
    ## amd
    "vulkan-radeon"
    ## nvidia
    "nvidia-open"
    "nvidia-utils"
    "nvidia-prime"

    # misc
    "gnome-keyring"
    "udisks2"
    "gvfs"

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

    # icons & color schemes
    "bibata-cursor-theme-bin"
    "papirus-icon-theme"
    "materia-gtk-theme"
    "materia-kde"
    "kvantum-theme-materia"

    # theme manage
    "glib2"
    "qt5ct-kde"
    "qt6ct-kde"
    "kvantum-qt5"
    "kvantum"
    "matugen"

    # hyprland
    "hyprland"
    "hyprpaper"
    "playerctl"
    "brightnessctl"
    "jq"
    "slurp"
    "grim"
    "wl-clipboard"

    # ime
    "fcitx5"
    "fcitx5-configtool"
    "fcitx5-bamboo"

    # cli utils
    "less"
    "tree"
    "libnotify"

    # apps
    ## editor
    "helix"
    ## terminal
    "kitty"
    ## file
    "thunar"
    "tumbler" # thunar - thumbnail previews
    "ffmpegthumbnailer" # thunar - video thumbnails
    "freetype2" # thunar - font thumbnails
    ## browser
    "firefox"
    ## others
    "btop"
    "rocm-smi-lib" # btop - amd gpu support
    "nvtop"

    # developments
    "python"
    "rust"

    # dotfiles
    "chezmoi"
)
