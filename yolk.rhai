import "chameleon" as chameleon;

export const colors = chameleon::theme;
export let eggs = #{
    bash: #{
        targets: #{
            ".bashrc":       "~/.bashrc",
            ".profile":      "~/.profile",
            ".bash_profile": "~/.bash_profile",
        },
    },
    fish: #{
        targets: #{
            "config.fish": "~/.config/fish/config.fish",
        },
    },
    starship: #{
        targets: #{
            "starship.toml": "~/.config/starship.toml",
        },
    },

    nvim: #{
        targets: "~/.config/nvim",
    },

    bin: #{
        targets: #{
            "xterm":                 "~/.local/bin/xterm",
            "game-performance":      "~/.local/bin/game-performance",
            "gamescope-performance": "~/.local/bin/gamescope-performance",
        },
        templates: ["game-performance"]
    },

    xdg: #{
        targets: #{
            "user-dirs.conf":                   "~/.config/user-dirs.conf",
            "user-dirs.dirs":                   "~/.config/user-dirs.dirs",
            "desktop-portal/niri-portals.conf": "~/.config/xdg-desktop-portal/niri-portals.conf",
        },
    },
    fontconfig: #{
        targets: #{
            "52-default-fonts.conf": "~/.config/fontconfig/conf.d/52-default-fonts.conf",
        },
    },

    niri: #{
        targets: #{
            "config.kdl": "~/.config/niri/config.kdl",
            "my":         "~/.config/niri/my",
        },
    },
    kitty: #{
        targets: "~/.config/kitty",
    },

    gaming: #{
        targets: #{
            "gamemode.ini": "~/.config/gamemode.ini",
            "MangoHud":     "~/.config/MangoHud",
        },
    },
};
