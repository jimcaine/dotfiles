local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.sql_formatter,
    },
})

vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { noremap = true })
