local utils = require("my.utils")
vim.pack.add({ utils.gh("ibhagwan/fzf-lua") })

-- config
local fzf = require("fzf-lua")
fzf.setup()

vim.keymap.set("n", "<leader>ff", fzf.files,     { silent = true, desc = "fzf files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { silent = true, desc = "fzf live grep" })
