return {
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
}
