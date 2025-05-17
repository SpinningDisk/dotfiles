-- Load LazyVim (must be first to avoid missing dependencies)
require("config.lazy")

-- Setup lazy.nvim (ensure LazyVim is included here)
require("lazy").setup({
    -- LazyVim core
    { "folke/LazyVim", priority = 1000 },

    -- Lualine and its dependencies
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "", right = "" },
                },
            })
        end,
    },

    -- Treesitter (with deduplication support)
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
            end
            require("nvim-treesitter.configs").setup(opts)
        end,
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "lua",
                "python",
                "vim",
                "yaml",
            },
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
})


-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Use 4 spaces for tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Highlight current line
vim.opt.cursorline = true

-- Smooth scrolling
vim.opt.scrolloff = 8

-- System clipboard support
vim.opt.clipboard:append("unnamedplus")


vim.cmd("syntax on")
vim.opt.termguicolors = true
vim.cmd("colorscheme unokai")



