local utils = require("my.utils")
vim.pack.add({ utils.gh("m4xshen/autoclose.nvim") })

-- config
require("autoclose").setup()
