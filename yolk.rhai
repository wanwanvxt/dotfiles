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
        targets: "~",
        strategy: "merge",
    },
    fish: #{
        targets: "~/.config/fish",
        strategy: "merge",
    },

    _config: #{
        targets: "~/.config",
        strategy: "merge",
    },

    bin: #{
        targets: "~/.local/bin",
        strategy: "merge",
    },

    fontconfig: #{
        targets: "~/.config/fontconfig/conf.d",
        strategy: "merge",
    },

    "xdg-portal": #{
        targets: "~/.config/xdg-desktop-portal",
        strategy: "merge",
    },

    niri: #{
        targets: "~/.config/niri",
        templates: ["**/*.kdl"],
        strategy: "merge",
    },

    kitty: #{
        targets: "~/.config/kitty",
        templates: ["**/*.conf"],
    },

    nvim: #{
        targets: "~/.config/nvim",
        templates: ["**/*.lua"],
    },

    MangoHud: #{
        targets: "~/.config/MangoHud",
    },
};
