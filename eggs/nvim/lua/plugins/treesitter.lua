local utils = require("my.utils")
vim.pack.add({ utils.gh("romus204/tree-sitter-manager.nvim") })

-- config
require("tree-sitter-manager").setup({
    auto_install = false,
    highlight = true,
})

vim.keymap.set("n", "<leader>t", "<cmd>TSManager<cr>", { silent = true, desc = "open treesitter manager" })
