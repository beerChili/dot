local M = {}

M.colors = {
    background           = "#121619",
    foreground           = "#F2F4F8",
    selection_background = "#222A2F",
    selection_foreground = "#E4E9F1",

    -- Base colors
    black                = "#161616",
    red                  = "#FA4D56",
    green                = "#24A148",
    yellow               = "#F1C21B",
    blue                 = "#1192E8",
    magenta              = "#A56EFF",
    cyan                 = "#007D79",
    white                = "#F4F4F4",

    -- Bright variants
    bright_black         = "#525252",
    bright_red           = "#FF8389",
    bright_green         = "#42BE65",
    bright_yellow        = "#FDDC69",
    bright_blue          = "#33B1FF",
    bright_magenta       = "#BE95FF",
    bright_cyan          = "#08BDBA",
    bright_white         = "#FFFFFF",
}

function M.setup()
    local highlights = {
        -- ====================================================================
        -- Core UI
        -- ====================================================================
        Normal          = { fg = M.colors.foreground, bg = M.colors.background },
        Visual          = { fg = M.colors.selection_foreground, bg = M.colors.selection_background },
        LineNr          = { fg = M.colors.bright_black },
        Cursor          = { fg = M.colors.background, bg = M.colors.selection_foreground },
        CursorLine      = { bg = M.colors.selection_background },
        CursorLineNr    = { fg = M.colors.foreground, bold = true },

        -- Search
        Search          = { fg = M.colors.background, bg = M.colors.yellow },
        IncSearch       = { fg = M.colors.background, bg = M.colors.bright_yellow },

        -- Floating Windows
        NormalFloat     = { fg = M.colors.foreground, bg = M.colors.background },
        FloatBorder     = { fg = M.colors.bright_black, bg = M.colors.background },

        -- ====================================================================
        -- Syntax
        -- ====================================================================
        Comment         = { fg = M.colors.bright_black },
        String          = { fg = M.colors.green },
        Keyword         = { fg = M.colors.red },
        Delimiter       = { fg = M.colors.foreground },
        Operator        = { fg = M.colors.foreground },
        Special         = { fg = M.colors.cyan },
        Identifier      = { fg = M.colors.blue },
        Function        = { fg = M.colors.blue },
        Type            = { fg = M.colors.magenta },
        Statement       = { fg = M.colors.red },
        PreProc         = { fg = M.colors.yellow },
        Constant        = { fg = M.colors.yellow },
        ["@variable"]   = { fg = M.colors.foreground },

        -- ====================================================================
        -- Tools & Plugins (Native)
        -- ====================================================================
        -- Diagnostics
        DiagnosticError = { fg = M.colors.bright_red },
        DiagnosticWarn  = { fg = M.colors.bright_yellow },
        DiagnosticInfo  = { fg = M.colors.bright_cyan },
        DiagnosticHint  = { fg = M.colors.bright_white },

        -- Quickfix Window
        QuickFixLine    = { bg = M.colors.yellow, fg = M.colors.background, bold = true },
        qfFileName      = { fg = M.colors.blue, bold = true },
        qfLineNr        = { fg = M.colors.yellow },
        qfError         = { fg = M.colors.red },
        qfSeparator     = { fg = M.colors.bright_black },

        -- Autocomplete Popup Menu
        Pmenu           = { bg = M.colors.selection_background, fg = M.colors.foreground },
        PmenuSel        = { bg = M.colors.foreground, fg = M.colors.background, bold = true },
        PmenuSbar       = { bg = M.colors.background },
        PmenuThumb      = { bg = M.colors.bright_black },
        PmenuMatch      = { fg = M.colors.cyan, bold = true },
        PmenuMatchSel   = { fg = M.colors.cyan, bold = true },

        -- ====================================================================
        -- Messages & Statusline
        -- ====================================================================
        -- System Messages
        OkMsg           = { fg = M.colors.bright_green },
        MoreMsg         = { fg = M.colors.bright_green },
        Question        = { fg = M.colors.bright_green },
        WarningMsg      = { fg = M.colors.bright_yellow },
        ErrorMsg        = { fg = M.colors.bright_red },
        Error           = { fg = M.colors.bright_red },

        -- Statusline
        StatusLine      = { fg = M.colors.foreground, bg = M.colors.background, bold = true, underline = true },
        StatusLineNC    = { fg = M.colors.bright_black, bg = M.colors.background },
        ModeMsg         = { fg = M.colors.bright_white, bold = true },

        -- Misc
        Title           = { fg = M.colors.bright_white, bold = true },
        Todo            = { fg = M.colors.yellow, bold = true },
    }

    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

return M
