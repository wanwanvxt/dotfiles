local utils = require("my.utils")

utils.lazy({
    name = "autoclose",
    packs = { utils.gh("m4xshen/autoclose.nvim") },
    event = "InsertEnter",
    config = function()
        require("autoclose").setup()
    end,
})
