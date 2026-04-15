local utils = require("my.utils")
utils.pack_add({ utils.gh("Cassin01/wf.nvim") })

-- config
require("wf").setup()

local which_key = require("wf.builtin.which_key")
vim.keymap.set("n", "<leader>", which_key({ text_insert_in_advance = "<leader>" }), { desc = "which-key" })
