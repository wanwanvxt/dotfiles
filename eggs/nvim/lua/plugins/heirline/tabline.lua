local utils = require("my.utils")
local hl_utils = require("heirline.utils")
local hl_conds = require("heirline.conditions")
local shared = require("plugins.heirline.shared")

local FileIcon = {
    condition = function()
        return not vim.g.is_tty
    end,
    init = function(self)
        local ext = vim.fn.fnamemodify(self.filepath, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(self.filepath, ext, { default = true })
    end,
    provider = function(self)
        return self.icon .. " "
    end,
    hl = function(self)
        return { fg = self.is_active and self.icon_color or "gray" }
    end,
}

local FileName = {
    provider = function(self)
        local filename = vim.fn.fnamemodify(self.filepath, ":t")
        if filename == "" then return "[No Name]" end
        return filename
    end,
}

local FileFlags = {
    {
        condition = function(self)
            return vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
        end,
        provider = utils.symbol_guard(" ", " [+]"),
    },
    {
        condition = function(self)
            return not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
                or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
        end,
        provider = utils.symbol_guard(" 󰌾", " [RO]"),
        hl = { fg = "red" },
    },
}

local FileBlock = {
    init = function(self)
        self.filepath = vim.api.nvim_buf_get_name(self.bufnr)
    end,
    on_click = {
        name = "TablineFileBlockOnClick",
        callback = function(_, minwid)
            vim.api.nvim_win_set_buf(0, minwid)
        end,
        minwid = function(self)
            return self.bufnr
        end,
    },
    FileIcon,
    FileName,
    FileFlags,
}

local CloseButton = {
    condition = function(self)
        return not vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
            and not vim.g.is_tty
    end,
    on_click = {
        name = "TablineCloseBufferOnClick",
        callback = function(_, minwid)
            vim.schedule(function()
                vim.api.nvim_buf_delete(minwid, { force = false })
                vim.cmd.redrawtabline()
            end)
        end,
        minwid = function(self)
            return self.bufnr
        end,
    },
    provider = utils.symbol_guard(" ", " x"),
    hl = { fg = "red" },
}

local BufferBlock = {
    hl = function(self)
        return self.is_active and "TabLineSel" or "TabLine"
    end,
    shared.Space,
    FileBlock,
    CloseButton,
    shared.Space,
}

local get_bufs = function()
    return vim.tbl_filter(function(bufnr)
        return vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
    end, vim.api.nvim_list_bufs())
end

local buflist_cache = {}

vim.api.nvim_create_autocmd({ "VimEnter", "UIEnter", "BufAdd", "BufDelete" }, {
    callback = function(args)
        vim.schedule(function()
            local bufs = get_bufs()
            for i, v in ipairs(bufs) do
                buflist_cache[i] = v
            end
            for i = #bufs+1, #buflist_cache do
                buflist_cache[i] = nil
            end

            if #buflist_cache > 1 then
                vim.o.showtabline = 2
            elseif vim.o.showtabline ~=1 then
                vim.o.showtabline = 1
            end
        end)
    end,
})

local BufferLine = hl_utils.make_buflist(
    BufferBlock,
    { provider = utils.symbol_guard(" ", "< "), hl = { fg = "gray" } },
    { provider = utils.symbol_guard(" ", " >"), hl = { fg = "gray" } },
    function()
        return buflist_cache
    end,
    false
)

local TabBlock = {
    update = { "TabNew", "TabClosed", "TabEnter", "TabLeave", "WinNew", "WinClosed" },
    provider = function(self)
        return string.format(" %d ", self.tabnr)
    end,
    hl = function(self)
        return self.is_active and "TabLineSel" or "TabLine"
    end,
}

local TabPages = {
    condition = function()
        return #vim.api.nvim_list_tabpages() >= 2
    end,
    hl_utils.make_tablist(TabBlock),
}

return {
    BufferLine,
    shared.Align,
    TabPages,
}
