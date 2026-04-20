local utils = require("my.utils")

return {
    Space = { provider = " " },
    Dot = {
        provider = utils.symbol_guard("·", ".")
    },
    VLine = {
        provider = utils.symbol_guard("│", "|"),
        hl = { fg = "bright_fg" },
    },
    Align = { provider = "%=" },
}
