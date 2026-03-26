return {
    "rebelot/heirline.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
        local function setup_colors()
            local hl_utils = require("heirline.utils")

            return {
                bright_bg  = hl_utils.get_highlight("Folded").bg,
                bright_fg  = hl_utils.get_highlight("Folded").fg,
                black      = hl_utils.get_highlight("Ignore").bg,
                white      = hl_utils.get_highlight("Title").fg,

                red        = hl_utils.get_highlight("Exception").fg,
                green      = hl_utils.get_highlight("String").fg,
                blue       = hl_utils.get_highlight("Function").fg,
                yellow     = hl_utils.get_highlight("Identifier").fg,
                purple     = hl_utils.get_highlight("Statement").fg,
                cyan       = hl_utils.get_highlight("Special").fg,
                orange     = hl_utils.get_highlight("Constant").fg,

                gray       = hl_utils.get_highlight("NonText").fg,
                comment    = hl_utils.get_highlight("Comment").fg,

                border     = hl_utils.get_highlight("FloatBorder").fg,
                visual     = hl_utils.get_highlight("Visual").bg,
                cursorline = hl_utils.get_highlight("CursorLine").bg,

                diag_warn  = hl_utils.get_highlight("DiagnosticWarn").fg,
                diag_error = hl_utils.get_highlight("DiagnosticError").fg,
                diag_info  = hl_utils.get_highlight("DiagnosticInfo").fg,
                diag_hint  = hl_utils.get_highlight("DiagnosticHint").fg,

                git_del    = hl_utils.get_highlight("diffDeleted").fg,
                git_add    = hl_utils.get_highlight("diffAdded").fg,
                git_change = hl_utils.get_highlight("diffChanged").fg,
            }
        end

        require("heirline").setup({
            statusline = require("my.plugins.lines.statusline"),
            tabline = require("my.plugins.lines.tabline"),
            opts = {
                colors = setup_colors,
            }
        })

        vim.api.nvim_create_autocmd("ColorScheme", {
            group = vim.api.nvim_create_augroup("Heirline", { clear = true }),
            callback = function()
                require("heirline.utils").on_colorscheme(setup_colors)
            end,
        })
    end,
}
