local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.autopep8,
    },
})

vim.keymap.set("n", "<leader>sf", vim.lsp.buf.format, { noremap = true, silent = true })
