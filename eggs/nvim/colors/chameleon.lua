vim.cmd.highlight("clear")
vim.g.colors_name = "chameleon"

local colors = {
    is_light_theme = false, -- {< rbet("=", ",", ` ${theme.colors.is_light_theme}`) >}
    base        = "#27262a", -- {< rcol(theme.colors.base) >}
    highlight   = "#2d2d30", -- {< rcol(theme.colors.highlight) >}
    surface     = "#1e1e21", -- {< rcol(theme.colors.surface) >}
    overlay     = "#504d54", -- {< rcol(theme.colors.overlay) >}
    muted       = "#877e89", -- {< rcol(theme.colors.muted) >}
    subtext     = "#bdb4bb", -- {< rcol(theme.colors.subtext) >}
    text        = "#d9d2d5", -- {< rcol(theme.colors.text) >}
    fg_accent_1 = "#bcaaf4", -- {< rcol(theme.colors.fg_accent_1) >}
    fg_accent_2 = "#f19ca4", -- {< rcol(theme.colors.fg_accent_2) >}
    fg_accent_3 = "#aec087", -- {< rcol(theme.colors.fg_accent_3) >}
    fg_accent_4 = "#dfac79", -- {< rcol(theme.colors.fg_accent_4) >}
    fg_accent_5 = "#76c3e4", -- {< rcol(theme.colors.fg_accent_5) >}
    fg_accent_6 = "#79c9bb", -- {< rcol(theme.colors.fg_accent_6) >}
    rg_accent_1 = "#8676b4", -- {< rcol(theme.colors.rg_accent_1) >}
    rg_accent_2 = "#b16a72", -- {< rcol(theme.colors.rg_accent_2) >}
    rg_accent_3 = "#7a885a", -- {< rcol(theme.colors.rg_accent_3) >}
    rg_accent_4 = "#a2784d", -- {< rcol(theme.colors.rg_accent_4) >}
    rg_accent_5 = "#498ba6", -- {< rcol(theme.colors.rg_accent_5) >}
    rg_accent_6 = "#4d9085", -- {< rcol(theme.colors.rg_accent_6) >}
    bg_accent_1 = "#524576", -- {< rcol(theme.colors.bg_accent_1) >}
    bg_accent_2 = "#733c42", -- {< rcol(theme.colors.bg_accent_2) >}
    bg_accent_3 = "#495431", -- {< rcol(theme.colors.bg_accent_3) >}
    bg_accent_4 = "#674726", -- {< rcol(theme.colors.bg_accent_4) >}
    bg_accent_5 = "#21566b", -- {< rcol(theme.colors.bg_accent_5) >}
    bg_accent_6 = "#265951", -- {< rcol(theme.colors.bg_accent_6) >}
    fg_red      = "#f19ca4", -- {< rcol(theme.colors.fg_red) >}
    fg_yellow   = "#dfac79", -- {< rcol(theme.colors.fg_yellow) >}
    fg_green    = "#acc189", -- {< rcol(theme.colors.fg_green) >}
    fg_cyan     = "#79c9bb", -- {< rcol(theme.colors.fg_cyan) >}
    fg_blue     = "#b6acf6", -- {< rcol(theme.colors.fg_blue) >}
    fg_magenta  = "#cca4ea", -- {< rcol(theme.colors.fg_magenta) >}
    rg_red      = "#b16a72", -- {< rcol(theme.colors.rg_red) >}
    rg_yellow   = "#a2784d", -- {< rcol(theme.colors.rg_yellow) >}
    rg_green    = "#78895b", -- {< rcol(theme.colors.rg_green) >}
    rg_cyan     = "#4d9085", -- {< rcol(theme.colors.rg_cyan) >}
    rg_blue     = "#8178b6", -- {< rcol(theme.colors.rg_blue) >}
    rg_magenta  = "#9371ac", -- {< rcol(theme.colors.rg_magenta) >}
    bg_red      = "#783840", -- {< rcol(theme.colors.bg_red) >}
    bg_yellow   = "#694622", -- {< rcol(theme.colors.bg_yellow) >}
    bg_green    = "#485432", -- {< rcol(theme.colors.bg_green) >}
    bg_cyan     = "#265951", -- {< rcol(theme.colors.bg_cyan) >}
    bg_blue     = "#4e4777", -- {< rcol(theme.colors.bg_blue) >}
    bg_magenta  = "#5d4170", -- {< rcol(theme.colors.bg_magenta) >}
    black       = "#27262a", -- {< rcol(theme.colors.black) >}
    white       = "#d9d2d5", -- {< rcol(theme.colors.white) >}
}

local hi = function(name, val)
    val.force = true
    val.cterm = val.cterm or {}
    vim.api.nvim_set_hl(0, name, val)
end

vim.g.terminal_color_0  = colors.base
vim.g.terminal_color_8  = colors.overlay
vim.g.terminal_color_1  = colors.rg_red
vim.g.terminal_color_9  = colors.fg_red
vim.g.terminal_color_2  = colors.rg_green
vim.g.terminal_color_10 = colors.fg_green
vim.g.terminal_color_3  = colors.rg_yellow
vim.g.terminal_color_11 = colors.fg_yellow
vim.g.terminal_color_4  = colors.rg_blue
vim.g.terminal_color_12 = colors.fg_blue
vim.g.terminal_color_5  = colors.rg_magen
vim.g.terminal_color_13 = colors.fg_magen
vim.g.terminal_color_6  = colors.rg_cyan
vim.g.terminal_color_14 = colors.fg_cyan
vim.g.terminal_color_7  = colors.subtext
vim.g.terminal_color_15 = colors.text

-- general
hi("Cur")
hi("Normal",      { fg = colors.text, ctermfg = 15 })
hi("NormalFloat", { link = "Normal" })
