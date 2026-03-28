return {
    "rebelot/kanagawa.nvim",
    enabled = not vim.g.is_tty,
    lazy = false,
    priority = 1000,
    config = function()
        vim.opt.termguicolors = true
        vim.cmd.colorscheme("kanagawa-dragon")
    end
}
