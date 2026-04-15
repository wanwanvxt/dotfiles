if not vim.g.is_tty then
    local utils = require("my.utils")
    vim.pack.add({{ src = utils.gh("nvim-mini/mini.icons"), version = "stable" }})

    -- config
    local mini_icons = require("mini.icons")
    mini_icons.setup()
    mini_icons.mock_nvim_web_devicons()
    mini_icons.tweak_lsp_kind()
end
