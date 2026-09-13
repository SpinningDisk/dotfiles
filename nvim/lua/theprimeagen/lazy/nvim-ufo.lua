return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
    -- These two lines are required — tell neovim to delegate folding to ufo
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99  -- start with everything open
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }  -- fallback chain
        end,
    })

    -- Keymaps
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    end,
}
