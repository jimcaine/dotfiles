require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright" }
})

local on_attach = function(_, bufnr)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

require("lspconfig").pyright.setup {
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "on",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true
            }
        }
    }
}

vim.keymap.set("n", "<leader>sr", ":LspRestart<CR>", {})
