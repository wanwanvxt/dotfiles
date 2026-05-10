export const theme = #{
    cursor: #{
        name: "Bibata-Modern-Ice",
        size: 24,
    },
    font: #{
        name: "sans-serif",
        size: 12,
    },
    font_mono: #{
        name: "monospace",
        size: 12,
    },
};
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
            "xterm":           "~/.local/bin/xterm",
            "performancemode": "~/.local/bin/performancemode",
            "game-run":        "~/.local/bin/game-run",
            "gamescope-run":   "~/.local/bin/gamescope-run",
        },
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

    matugen: #{
        targets: "~/.config/matugen",
    },
    niri: #{
        targets: #{
            "config.kdl": "~/.config/niri/config.kdl",
            "my":         "~/.config/niri/my",
        },
        templates: ["**/*.kdl"],
    },
    kitty: #{
        targets: "~/.config/kitty",
    },
    gamemode: #{
        targets: #{
            "gamemode.ini": "~/.config/gamemode.ini",
        },
    },
    MangoHud: #{
        targets: "~/.config/MangoHud",
    },
};
