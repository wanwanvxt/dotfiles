if not vim.g.is_tty then
    local utils = require("my.utils")
    vim.pack.add({ utils.gh("lukas-reineke/virt-column.nvim") })

    -- config
    require("virt-column").setup({
        char = "▕",
        highlight = "NonText",
    })
end
