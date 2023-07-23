local function set_keymap(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true })
end

local function create_user_command(name, command, opts)
  vim.api.nvim_create_user_command(name, command, opts)
end

vim.g.mapleader = ' '

-- easy close buffer
set_keymap('n', 'q', '<cmd>bd<cr>')
create_user_command('Q', 'q!', {})
create_user_command('Qa', 'qa!', {})

-- easy system clipboard access
set_keymap('n', 'Y', '"+y')
set_keymap('v', 'Y', '"+y')
set_keymap('n', 'P', '"+p')
set_keymap('v', 'P', '"+p')

--- easy window size adjustment
set_keymap('n', '+', '<C-w>+')
set_keymap('n', '_', '<C-w>-')
set_keymap('n', '=', '<C-w>>')
set_keymap('n', '-', '<C-w><')

-- easy window jumping
set_keymap('n', '<C-h>', '<C-w>h')
set_keymap('n', '<C-j>', '<C-w>j')
set_keymap('n', '<C-k>', '<C-w>k')
set_keymap('n', '<C-l>', '<C-w>l')

-- easy tab switching
set_keymap('n', '<C-,>', '<cmd>BufferLineCyclePrev<cr>')
set_keymap('n', '<C-.>', '<cmd>BufferLineCycleNext<cr>')

-- plugins
set_keymap('n', '<C-e>', '<cmd>NvimTreeToggle<cr>')
set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
set_keymap('n', '<leader>fs', '<cmd>Telescope live_grep<cr>')
set_keymap('n', '<leader>dw', '<cmd>Trouble workspace_diagnostics<cr>')
set_keymap('n', '<leader>df', '<cmd>Trouble document_diagnostics<cr>')
set_keymap('n', 'gd', '<cmd>Trouble lsp_definitions<cr>')
set_keymap('n', 'gr', '<cmd>Trouble lsp_references<cr>')
