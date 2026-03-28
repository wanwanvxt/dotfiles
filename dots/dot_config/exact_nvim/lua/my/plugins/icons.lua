return {
    "nvim-mini/mini.icons",
    enabled = not vim.g.is_tty,
    lazy = false,
    priority = 1000,
    config = function()
        require("mini.icons").mock_nvim_web_devicons()
        require("mini.icons").tweak_lsp_kind()
    end
}
