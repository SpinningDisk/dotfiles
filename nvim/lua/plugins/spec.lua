return {
    { "folke/LazyVim", priority = 1000},
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    section_seperators = {left = "hans", right = "peter"},
                    component_seperators = {left = "jurgen", right = "friz"},
                },
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "InsertEnter",
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
        },
        config = function()
	end;
    },
    {
        "folke/which-key.nvim",
        opts = {
            spec = {
                { "<BS>", desc = "Decrement Selection", mode = "x" },
                { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        config = function(_, opts)
            local config = require("lazy.core.config")
            -- crashes: no "deput" function in config;
            -- if type(opts.ensure_installed) == "table" then
            --     opts.ensure_installed = config.dedup(opts.ensure_installed)
            -- end
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
    {
        "preservim/nerdtree",
        keys = {
            { "<leader>n", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree"},
        },
        init = function()
            vim.g.NERDTreeShowHidden = 1
            vim.g.NERDTreeMinimalUI = 1
            vim.g.NERDTreeDirArrows = 1
        end,
        cmd = { "NERDTreeToggle", "NERDTreeFind" },
    }
}
