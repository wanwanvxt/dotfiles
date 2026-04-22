local plugins = {
    "kanagawa", "autoclose", "blankline",
    "heirline", "which-key", "neo-tree", "fzf",
    "cmp", "treesitter", "lsp", "colorizer",
}

for _, plg in ipairs(plugins) do
    local ok = pcall(require, "plugins." .. plg)
    if not ok then
        local msg = string.format("Plugin '%s' could not be loaded!", plg)
        vim.notify(msg, vim.log.levels.ERROR, { title = "nvim-config" })
    end
end
