return {
    bashls   = { cmd = { "bash-language-server", "start" } },
    fish_lsp = { cmd = { "fish-lsp", "start" } },
    vimls    = { cmd = { "vim-language-server", "--stdio" } },
    lua_ls   = { cmd = { "lua-language-server" } },
    ruff     = { cmd = { "ruff", "server" } },
    clangd   = { cmd = { "clangd" } },
    qmlls    = { cmd = { "qmlls6" } },
    ols      = { cmd = { "ols" } },
}
