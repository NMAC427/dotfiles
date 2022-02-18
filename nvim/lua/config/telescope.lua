require('telescope').setup {

}

-- Configure keymap
local utils = require('config.utils')
local keymap = utils.keymap

keymap('n', '<leader>ff', '<cmd>:Telescope find_files previewer=false<CR>')
keymap('n', '<leader>fb', '<cmd>:Telescope current_buffer_fuzzy_find<CR>')
