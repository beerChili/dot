-- ============================================================================
-- Globals
-- ============================================================================
vim.g.mapleader        = " "
vim.g.maplocalleader   = " "

-- ============================================================================
-- Options
-- ============================================================================
-- UI & Behavior
vim.opt.mouse          = ""
vim.opt.title          = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.scrolloff      = 10 -- Keep cursor 10 lines away from screen edges
vim.opt.wrap           = false
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.signcolumn     = "yes" -- Prevent layout shifts when diagnostics appear
vim.opt.winborder      = "bold"
vim.opt.cursorline     = true
vim.opt.wildoptions    = "pum,fuzzy"         -- Native fuzzy command line completion
vim.opt.wildmode       = "longest:full,full" -- Shell-like completion behavior

-- Timing & Performance
vim.opt.updatetime     = 300 -- Trigger background events and diagnostics faster
vim.opt.timeoutlen     = 500 -- Wait less time for mapped key sequences

-- Formatting & Search
vim.opt.expandtab      = true
vim.opt.shiftwidth     = 4
vim.opt.tabstop        = 4
vim.opt.softtabstop    = 4
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})

-- System & Files
vim.opt.clipboard        = "unnamedplus" -- Sync with system OS clipboard
vim.opt.swapfile         = false
vim.opt.undofile         = true

-- ============================================================================
-- Built-in Tools & Integrations
-- ============================================================================
-- Netrw
vim.g.netrw_banner       = 0
vim.g.netrw_liststyle    = 3
vim.g.netrw_browse_split = 4

-- FZF (Executable)
vim.opt.rtp:append("/opt/homebrew/opt/fzf")
vim.keymap.set("n", "<leader>ff", ":FZF<CR>")

-- Ripgrep
vim.opt.grepprg    = "rg --vimgrep --no-heading --smart-case"
vim.opt.grepformat = "%f:%l:%c:%m"

vim.keymap.set("n", "<leader>fg", function()
    local term = vim.fn.input("grep ❯ ")
    if term == "" then return end
    vim.cmd("silent grep " .. vim.fn.shellescape(term))
    vim.fn.setqflist({}, "r", { title = "grep ❯ " .. term })
    vim.cmd("copen")
end)

-- ============================================================================
-- Quickfix Menu
-- ============================================================================
vim.keymap.set("n", "[q", ":cprev<CR>zz")
vim.keymap.set("n", "]q", ":cnext<CR>zz")

vim.keymap.set("n", "<leader>q", function()
    if vim.fn.getqflist({ winid = 0 }).winid > 0 then
        vim.cmd("cclose")
    else
        vim.cmd("copen")
    end
end)

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("QuickFixLogic", { clear = true }),
    pattern = "qf",
    callback = function()
        vim.opt_local.relativenumber = false
        -- Jump and close
        vim.keymap.set("n", "<CR>", "<CR>:cclose<CR>", { buffer = true, silent = true })
        -- Preview and return focus
        vim.keymap.set("n", "<leader>p", "<CR><C-w>p", { buffer = true, silent = true })
    end,
})

-- ============================================================================
-- LSP Configurations
-- ============================================================================
-- Enable native fuzzy matching for omnifunc
vim.opt.completeopt = { "menuone", "noselect", "fuzzy" }

-- Automatically discovers and loads configs from the `lsp/` directory
vim.lsp.enable({ "lua-ls", "dartls", "csharp-ls", "zls", "ts-ls", "terraformls" })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gra", function()
            vim.lsp.buf.code_action({
                filter = function(action) return action.disabled == nil or not action.disabled end,
            })
        end, opts)
        vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
    end,
})

-- Native progress UI
vim.api.nvim_create_autocmd('LspProgress', {
    callback = function(ev)
        local value = ev.data.params.value
        vim.api.nvim_echo({ { value.message or 'done' } }, false, {
            id = 'lsp',
            kind = 'progress',
            source = "lsp",
            title = value.title,
            status = value.kind ~= 'end' and 'running' or 'success',
            percent = value.percentage,
        })
    end,
})

-- ============================================================================
-- Theme
-- ============================================================================
require("plex_theme").setup()
