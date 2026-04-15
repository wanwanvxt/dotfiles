if not vim.g.is_tty then
    local utils = require("my.utils")
    vim.pack.add({
        utils.gh("lukas-reineke/indent-blankline.nvim"),
        utils.gh("lukas-reineke/virt-column.nvim"),
    })

    -- config
    require("ibl").setup({
        enabled = true,
        indent = {
            char = "▏",
            tab_char = nil,
            highlight = "NonText",
        },
        scope = {
            enabled = true,
            char = "▎",
            highlight = "CursorColumn",
            show_start = true,
            show_end = true,
            show_exact_scope = true,
            injected_languages = true,
        },
    })

    -- config
    require("virt-column").setup({
        char = "▕",
        highlight = "NonText",
    })
end
