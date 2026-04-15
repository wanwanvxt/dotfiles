if not vim.g.is_tty then
    local utils = require("my.utils")
    utils.pack_add({ utils.gh("shellRaining/hlchunk.nvim") })

    -- config
    require("hlchunk").setup({
        indent = {
            enable = true,
            priority = 10,
            chars = { "▏" },
            style = { vim.api.nvim_get_hl(0, { name = "NonText" }) },
        },
    })
end
