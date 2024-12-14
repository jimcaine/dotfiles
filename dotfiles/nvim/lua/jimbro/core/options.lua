local function get_wal_color(index)
    local wal_colors_file = vim.fn.expand("~/.cache/wal/colors.json")
    local ok, json = pcall(vim.fn.json_decode, vim.fn.readfile(wal_colors_file))
    if ok and json and json["colors"] then
        return json["colors"]["color" .. index] or "#d3d3d3" -- Default to light grey if color not found
    end
    return "#d3d3d3" -- Fallback color
end

vim.opt.nu = true
vim.opt.relativenumber = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")
vim.opt.timeoutlen = 200
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        local color = get_wal_color(1) -- Choose a color index (0-15) from Pywal
        vim.opt.colorcolumn = "80"
        vim.cmd("highlight ColorColumn guibg=" .. color)
    end,
})
