local function set_keymap(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true })
end

local function create_user_command(name, command, opts)
  vim.api.nvim_create_user_command(name, command, opts)
end

vim.g.mapleader = ' '

-- easier close buffer
set_keymap('n', 'q', '<cmd>bd<cr>')
create_user_command('Q', 'q!', {})
create_user_command('Qa', 'qa!', {})

-- easier system clipboard access
set_keymap('n', 'Y', '"+y')
set_keymap('v', 'Y', '"+y')
set_keymap('n', 'P', '"+p')
set_keymap('v', 'P', '"+p')

--- easier window size adjustment
set_keymap('n', '+', '<C-w>+')
set_keymap('n', '_', '<C-w>-')
set_keymap('n', '=', '<C-w>>')
set_keymap('n', '-', '<C-w><')

-- easier window jumping
set_keymap('n', '<C-h>', '<C-w>h')
set_keymap('n', '<C-j>', '<C-w>j')
set_keymap('n', '<C-k>', '<C-w>k')
set_keymap('n', '<C-l>', '<C-w>l')

-- easier command mode navigation
set_keymap('c', '<C-h>', '<Left>')
set_keymap('c', '<C-l>', '<Right>')
set_keymap('c', '<C-j>', '<Down>')
set_keymap('c', '<C-k>', '<Up>')
set_keymap('c', '<C-b>', '<S-Left>')
set_keymap('c', '<C-w>', '<S-Right>')

-- plugins
set_keymap('n', '<C-e>', '<cmd>NvimTreeToggle<cr>')
set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
set_keymap('n', '<leader>fs', '<cmd>Telescope live_grep<cr>')
set_keymap('n', '<leader>fw', '<cmd>Telescope grep_string<cr>')
set_keymap('n', '<leader>dw', '<cmd>Telescope diagnostics<cr>')
set_keymap('n', '<leader>df', '<cmd>Telescope diagnostics bufnr=0<cr>')
set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<cr>')
set_keymap('n', 'gr', '<cmd>Telescope lsp_references<cr>')
set_keymap('n', '<leader>fm', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
set_keymap('n', '<leader>am', '<cmd>lua require("harpoon.mark").add_file()<cr>')
set_keymap('n', '<C-,>', '<cmd>lua require("harpoon.ui").nav_next()<cr>')
set_keymap('n', '<C-.>', '<cmd>lua require("harpoon.ui").nav_prev()<cr>')