if not vim.g.is_tty then
    local utils = require("my.utils")
    vim.pack.add({ utils.gh("rebelot/kanagawa.nvim") })

    -- config
    local colors = {
        is_light_theme = false, -- {< rr("is_light_theme.*,", `is_light_theme = ${theme.colors.is_light_theme},`) >}
        base        = "#141a10", -- {< rcol(theme.colors.base) >}
        highlight   = "#1a2016", -- {< rcol(theme.colors.highlight) >}
        surface     = "#0f140b", -- {< rcol(theme.colors.surface) >}
        overlay     = "#464d42", -- {< rcol(theme.colors.overlay) >}
        muted       = "#6d7468", -- {< rcol(theme.colors.muted) >}
        subtext     = "#90988b", -- {< rcol(theme.colors.subtext) >}
        text        = "#b5bdb0", -- {< rcol(theme.colors.text) >}
        fg_accent_1 = "#74a467", -- {< rcol(theme.colors.fg_accent_1) >}
        fg_accent_2 = "#a8944b", -- {< rcol(theme.colors.fg_accent_2) >}
        fg_accent_3 = "#be8668", -- {< rcol(theme.colors.fg_accent_3) >}
        fg_accent_4 = "#938fba", -- {< rcol(theme.colors.fg_accent_4) >}
        fg_accent_5 = "#46a79c", -- {< rcol(theme.colors.fg_accent_5) >}
        fg_accent_6 = "#609ebb", -- {< rcol(theme.colors.fg_accent_6) >}
        rg_accent_1 = "#537e48", -- {< rcol(theme.colors.rg_accent_1) >}
        rg_accent_2 = "#82702e", -- {< rcol(theme.colors.rg_accent_2) >}
        rg_accent_3 = "#94644a", -- {< rcol(theme.colors.rg_accent_3) >}
        rg_accent_4 = "#706c90", -- {< rcol(theme.colors.rg_accent_4) >}
        rg_accent_5 = "#268177", -- {< rcol(theme.colors.rg_accent_5) >}
        rg_accent_6 = "#437992", -- {< rcol(theme.colors.rg_accent_6) >}
        bg_accent_1 = "#325528", -- {< rcol(theme.colors.bg_accent_1) >}
        bg_accent_2 = "#584a10", -- {< rcol(theme.colors.bg_accent_2) >}
        bg_accent_3 = "#65412c", -- {< rcol(theme.colors.bg_accent_3) >}
        bg_accent_4 = "#4a4761", -- {< rcol(theme.colors.bg_accent_4) >}
        bg_accent_5 = "#00574f", -- {< rcol(theme.colors.bg_accent_5) >}
        bg_accent_6 = "#265163", -- {< rcol(theme.colors.bg_accent_6) >}
        fg_red      = "#bf8473", -- {< rcol(theme.colors.fg_red) >}
        fg_yellow   = "#a8944b", -- {< rcol(theme.colors.fg_yellow) >}
        fg_green    = "#74a467", -- {< rcol(theme.colors.fg_green) >}
        fg_cyan     = "#46a79c", -- {< rcol(theme.colors.fg_cyan) >}
        fg_blue     = "#938fba", -- {< rcol(theme.colors.fg_blue) >}
        fg_magenta  = "#a08bb2", -- {< rcol(theme.colors.fg_magenta) >}
        rg_red      = "#956354", -- {< rcol(theme.colors.rg_red) >}
        rg_yellow   = "#82702e", -- {< rcol(theme.colors.rg_yellow) >}
        rg_green    = "#537e48", -- {< rcol(theme.colors.rg_green) >}
        rg_cyan     = "#268177", -- {< rcol(theme.colors.rg_cyan) >}
        rg_blue     = "#706c90", -- {< rcol(theme.colors.rg_blue) >}
        rg_magenta  = "#7b6989", -- {< rcol(theme.colors.rg_magenta) >}
        bg_red      = "#654034", -- {< rcol(theme.colors.bg_red) >}
        bg_yellow   = "#584a10", -- {< rcol(theme.colors.bg_yellow) >}
        bg_green    = "#325528", -- {< rcol(theme.colors.bg_green) >}
        bg_cyan     = "#00574f", -- {< rcol(theme.colors.bg_cyan) >}
        bg_blue     = "#4a4761", -- {< rcol(theme.colors.bg_blue) >}
        bg_magenta  = "#52445c", -- {< rcol(theme.colors.bg_magenta) >}
        black       = "#141a10", -- {< rcol(theme.colors.black) >}
        white       = "#b5bdb0", -- {< rcol(theme.colors.white) >}
        bright_black = "#434840", --- {< rcol(lighten(theme.colors.black, 20)) >}
        bright_white = "#c4cac0", --- {< rcol(lighten(theme.colors.white, 20)) >}
    }
    require("kanagawa").setup({
        colors = {
            theme = {
                all = {
                    ui = {
                        fg         = colors.text,
                        fg_dim     = colors.subtext,
                        fg_reverse = colors.base,

                        bg_dim     = colors.surface,
                        bg_gutter  = colors.surface,

                        bg_m3      = colors.surface,
                        bg_m2      = colors.surface,
                        bg_m1      = colors.surface,
                        bg         = colors.base,
                        bg_p1      = colors.highlight,
                        bg_p2      = colors.highlight,

                        special    = colors.subtext,
                        nontext    = colors.overlay,
                        whitespace = colors.overlay,

                        bg_search  = colors.bg_accent_1,
                        bg_visual  = colors.bg_accent_1,

                        pmenu      = {
                            fg       = colors.text,
                            fg_sel   = "none",
                            bg       = colors.highlight,
                            bg_sel   = colors.bg_accent_1,
                            bg_sbar  = colors.surface,
                            bg_thumb = colors.overlay,
                        },
                        float      = {
                            fg        = colors.text,
                            bg        = colors.highlight,
                            fg_border = colors.overlay,
                            bg_border = colors.highlight,
                        },
                    },
                    syn = {
                        string     = colors.fg_green,
                        variable   = "none",
                        number     = colors.fg_red,
                        constant   = colors.fg_yellow,

                        identifier = colors.fg_cyan,
                        parameter  = colors.fg_magenta,
                        fun        = colors.fg_blue,

                        statement  = colors.fg_magenta,
                        keyword    = colors.fg_magenta,
                        operator   = colors.subtext,

                        preproc    = colors.fg_red,
                        type       = colors.fg_cyan,
                        regex      = colors.rg_red,

                        deprecated = colors.overlay,
                        comment    = colors.muted,
                        punct      = colors.muted,

                        special1   = colors.fg_accent_1,
                        special2   = colors.fg_accent_2,
                        special3   = colors.fg_accent_3,
                    },
                    vcs = {
                        added   = colors.fg_green,
                        removed = colors.fg_red,
                        changed = colors.fg_yellow,
                    },
                    diff = {
                        add    = colors.bg_green,
                        delete = colors.bg_red,
                        change = colors.bg_blue,
                        text   = colors.bg_yellow,
                    },
                    diag = {
                        ok      = colors.fg_green,
                        error   = colors.fg_red,
                        warning = colors.fg_yellow,
                        info    = colors.fg_blue,
                        hint    = colors.fg_hint,
                    },
                    term = {
                        colors.black,
                        colors.rg_red,
                        colors.rg_green,
                        colors.rg_yellow,
                        colors.rg_blue,
                        colors.rg_magenta,
                        colors.rg_cyan,
                        colors.white,
                        colors.bright_black,
                        colors.fg_red,
                        colors.fg_green,
                        colors.fg_yellow,
                        colors.fg_blue,
                        colors.fg_magenta,
                        colors.fg_cyan,
                        colors.bright_white,
                    },
                },
            },
        },
    })
    vim.cmd.colorscheme("kanagawa")
end
