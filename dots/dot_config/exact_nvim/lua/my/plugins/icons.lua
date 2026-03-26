return {
    "nvim-mini/mini.icons",
    lazy = false,
    priority = 1000,
    config = function()
        require("mini.icons").mock_nvim_web_devicons()
        require("mini.icons").tweak_lsp_kind()
    end
}
