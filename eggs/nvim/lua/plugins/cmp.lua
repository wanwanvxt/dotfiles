local utils = require("my.utils")
vim.pack.add({
    utils.gh("hrsh7th/nvim-cmp"),
    -- dependencies
    utils.gh("L3MON4D3/LuaSnip"),
    utils.gh("saadparwaiz1/cmp_luasnip"),
    utils.gh("hrsh7th/cmp-path"),
    utils.gh("hrsh7th/cmp-buffer"),
    utils.gh("hrsh7th/cmp-cmdline"),
    utils.gh("hrsh7th/cmp-nvim-lsp"),
})

-- config
local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Esc>"] = cmp.mapping.close(),
    }),
    sources = {
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "nvim_lsp" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "path" },
        { name = "cmdline" },
    },
})
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    }
})
