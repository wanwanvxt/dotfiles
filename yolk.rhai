import "chameleon" as chameleon;

fn lighten_channel(c, factor) {
    let val = c.to_float();

    let new_val = if factor >= 0.0 {
        val + (255.0 - val) * factor
    } else {
        val * (1.0 + factor)
    };

    let clamped = if new_val < 0.0 { 0.0 }
                 else if new_val > 255.0 { 255.0 }
                 else { new_val };

    return clamped.round().to_int();
}

fn lighten(hexCol, thres) {
    let rgb = color_hex_to_rgb(hexCol);
    let factor = thres.to_float() / 100.0;

    let newRgb = #{
        r: lighten_channel(rgb["r"], factor),
        g: lighten_channel(rgb["g"], factor),
        b: lighten_channel(rgb["b"], factor),
    };
    return color_rgb_to_hex(newRgb);
}

export const theme = #{
    cursor: #{
        name: "Bibata-Modern-Ice",
        size: 24,
    },
    colors: chameleon::theme,
};
export let eggs = #{
    thaimeleon: #{
        targets: "~/.config/thaimeleon",
    },

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
        templates: ["**/*.lua"],
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
            "user-dirs.conf":    "~/.config/user-dirs.conf",
            "user-dirs.dirs":    "~/.config/user-dirs.dirs",
            "niri-portals.conf": "~/.config/xdg-desktop-portal/niri-portals.conf",
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
        templates: ["**/*.kdl"],
    },
    kitty: #{
        targets: "~/.config/kitty",
        templates: ["**/*.conf"],
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
