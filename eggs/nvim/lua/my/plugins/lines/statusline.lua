local utils = require("my.utils")
local hl_utils = require("heirline.utils")
local hl_conds = require("heirline.conditions")
local shared = require("my.plugins.lines.shared")

local Mode = {
    init = function(self)
        self.mode = vim.fn.mode()
    end,
    static = {
        mode_names = {
            n       = "NORMAL",
            v       = "VISUAL",
            V       = "V-LINE",
            ["\22"] = "V-BLOCK",
            s       = "SELECT",
            S       = "S-LINE",
            ["\19"] = "S-BLOCK",
            i       = "INSERT",
            R       = "REPLACE",
            c       = "COMMAND",
            r       = "PROMPT",
            ["!"]   = "SHELL",
            t       = "TERMINAL",
        },
        mode_colors = {
            n       = "green",
            v       = "cyan",
            V       = "cyan",
            ["\22"] = "cyan",
            s       = "purple",
            S       = "purple",
            ["\19"] = "purple",
            i       = "blue",
            R       = "red",
            c       = "orange",
            r       = "orange",
            ["!"]   = "green",
            t       = "green",
        },
    },
    update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
            vim.cmd("redrawstatus")
        end),
    },
    provider = function(self)
        return string.format(" %s ", self.mode_names[self.mode])
    end,
    hl = function(self)
        return { bg = self.mode_colors[self.mode], fg = "black", bold = true }
    end,
}

local FileIcon = {
    condition = function()
        return not vim.g.is_tty
    end,
    init = function(self)
        local ext = vim.fn.fnamemodify(self.filepath, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(self.filepath, ext, { default = true })
    end,
    provider = function(self)
        return string.format("%s ", self.icon)
    end,
    hl = function(self)
        return { fg = hl_conds.is_active() and self.icon_color or "gray" }
    end,
}

local FilePath = {
    provider = function(self)
        local file_relpath = vim.fn.fnamemodify(self.filepath, ":.")
        if file_relpath == "" then return "[No Name]" end

        if not hl_conds.width_percent_below(#file_relpath, 0.25) then
            local p = vim.fn.fnamemodify(file_relpath, ":~:.")
            return vim.fn.pathshorten(p)
        end
        return file_relpath
    end,
    hl = function()
        return { fg = hl_conds.is_active() and "white" or "gray" }
    end,
}

local FileFlags = {
    {
        condition = function()
            return vim.bo.modified
        end,
        provider = utils.symbol_guard(" ", " [+]"),
        hl = function()
            return { fg = hl_conds.is_active() and "white" or "gray" }
        end,
    },
    {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = utils.symbol_guard(" 󰌾", " [RO]"),
        hl = { fg = "red" },
    },
}

local FileEcoding = {
    provider = function()
        local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
        local fmt = vim.bo.fileformat
        local type = vim.bo.filetype
        if not type or type == "" then
            type = "unknown"
        end
        return string.format(" %s[%s] %s ", enc, fmt, type)
    end,
    hl = function()
        return { bg = "bright_bg", fg = hl_conds.is_active() and "green" or "gray" }
    end,
}

local FileBlock = {
    init = function(self)
        self.filepath = vim.api.nvim_buf_get_name(0)
    end,
    shared.Space,
    FileIcon,
    FilePath,
    FileFlags,
    shared.Space,
    FileEcoding,
}

local LSPActive = {
    condition = hl_conds.lsp_attached,
    update = { "LspAttach", "LspDetach" },
    provider = function()
        local names = {}
        for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
            table.insert(names, server.name)
        end
        return string.format(" %s%s ", utils.symbol_guard(" ", ""), table.concat(names, " "))
    end,
    hl = { bg = "bright_bg", fg = "purple" },
}

local Diagnostics = {
    condition = hl_conds.has_diagnostics,
    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warns  = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.infos  = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        self.hints  = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    end,
    on_click = {
        name = "StatusLineDiagnosticsOnClick",
        callback = function()
            vim.diagnostic.setqflist()
        end,
    },
    update = { "DiagnosticChanged", "BufEnter" },
    shared.Space,
    {
        provider = function(self)
            return string.format("%s%d", utils.symbol_guard(" ", "E."), self.errors)
        end,
        hl = { fg = "diag_error" },
    },
    shared.Space,
    {
        provider = function(self)
            return string.format("%s%d", utils.symbol_guard(" ", "W."), self.warns)
        end,
        hl = { fg = "diag_warn" },
    },
    shared.Space,
    {
        provider = function(self)
            return string.format("%s%d", utils.symbol_guard(" ", "I."), self.infos+self.hints)
        end,
        hl = { fg = "diag_info" },
    },
    shared.Space,
}

local Location = {
    provider = " %l/%L:%c ",
    hl = { bg = "green", fg = "black", bold = true },
}

---
local InactiveStatusLine = {
    condition = hl_conds.is_not_active,
    FileBlock,
    shared.Align,
}
local DefaultStatusLine = {
    Mode,
    FileBlock,
    shared.Align,
    Diagnostics,
    LSPActive,
    Location,
}

return {
    hl = "StatusLine",
    fallthrough = false,
    InactiveStatusLine,
    DefaultStatusLine,
}
