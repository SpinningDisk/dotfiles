return {
    "preservim/nerdtree",
    keys = {
        { "<Space>n", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree"},
        { "<Space>n", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree"},
    },
    init = function()
        vim.g.NERDTreeShowHidden = 1
        vim.g.NERDTreeMinimalUI = 1
        vim.g.NERDTreeDirArrows = 1
    end,
    cmd = { "NERDTreeToggle", "NERDTreeFind" },
}
