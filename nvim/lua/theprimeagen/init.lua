require("theprimeagen.set")
require("theprimeagen.remap")
require("theprimeagen.lazy_init")

-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

-- DO NOT INCLUDE THIS
-- DO.not

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


function filespecific_mappings()
    if vim.bo.filetype=="c" then
        vim.keymap.set("n", "<leader>ee", "oif(err!=0){<CR>}<Esc>Oreturn err;<Esc>")
        vim.keymap.set("n", "<leader>ef", "oif(err!=0){<Esc>ofprintf(stderr, \"Fatal: %d\", err);<Esc>oreturn err;<Esc>o}<Esc>jj")
    elseif vim.bo.filetype=="python" then
        vim.keymap.set("n", "<leader>ee", "oif err!=0: <Esc>oreturn err<Esc>")
        vim.keymap.set("n", "<leader>ef", "oif err!=0: <Esc>oprint(\"Fatal: {}\".format(err))<Esc>oreturn err<Esc>")
    elseif vim.bo.filetype=="make" then
        vim.keymap.set("n", "<leader>ee", "o.PHONY: clean build run test<Esc>o<Esc>o.clean:<Esc>oclean<Esc>obuild:<Esc>obuild<Esc>orun:<Esc>orun<Esc>o.test:<Esc>otest<Esc>")
    elseif vim.bo.filetype=="sh" then
        vim.keymap.set("n", "<leader>ee", "oif [ $? -ne 0 ]; then<Esc>oreturn $?<Esc>fi<Esc>")
        vim.keymap.set("n", "<leader>ef", "oif [ $? -ne 0 ]; then<Esc>oecho \"Fatal: $?\"<Esc>oreturn $?<Esc>fi<Esc>")
    elseif vim.bo.filetype=="header" then --  TODO: make this work
        vim.keymap.set("n", "<leader>ee", "o#ifndef __<Esc>o__<Esc>o#define __<Esc>o__<Esc>o#endif<Esc>")
    elseif vim.bo.filetype=="rust" then
        vim.keymap.set("n", "<leader>ee", "oif err!=0 {<CR>}<Esc>Oreturn err;<Esc>")
        vim.keymap.set("n", "<leader>ef", "oif err!=0 {<Esc>ofmt::error!(\"Fatal: {}\", err);<Esc>oreturn err;<Esc>o}<Esc>")
    end
end
autocmd('BufEnter', {
    group = ThePrimeagenGroup,
    callback = function()
        pcall(vim.cmd.colorscheme, "unokai")
        filespecific_mappings()
    end
})


autocmd('LspAttach', {
    group = ThePrimeagenGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leadern>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<leader>vsh", function() vim.lsp.buf.signature_help() end, opts) -- TODO: make this work
        -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
