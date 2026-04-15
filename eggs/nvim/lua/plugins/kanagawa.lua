if not vim.g.is_tty then
    local utils = require("my.utils")
    utils.pack_add({ utils.gh("rebelot/kanagawa.nvim") })

    -- config
    require("kanagawa").setup()
    vim.cmd.colorscheme("kanagawa-dragon")
end
