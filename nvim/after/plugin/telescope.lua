local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ef', builtin.find_files, {})
vim.keymap.set('n', '<leader>eg', builtin.live_grep, {})

vim.keymap.set('n', '<leader>bv', builtin.buffers, {})
