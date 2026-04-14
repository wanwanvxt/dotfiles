if not vim.g.is_tty then
    local utils = require("my.utils")
    vim.pack.add({{ src = utils.gh("nvim-mini/mini.icons"), version = "stable" }})

    -- config
    require("mini.icons").setup()
    require("mini.icons").mock_nvim_web_devicons()
    require("mini.icons").tweak_lsp_kind()
end
