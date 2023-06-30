-- vi: sw=2 ts=2

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }
local opts_sl = { noremap = true, silent = true }

-- insert mode
keymap('i', 'jk', '<esc>', opts)
keymap('i', 'kj', '<esc>', opts)

keymap('i', '<c-k>', '<up>', opts)
keymap('i', '<c-j>', '<down>', opts)
keymap('i', '<c-h>', '<left>', opts)
keymap('i', '<c-l>', '<right>', opts)

keymap('i', '<c-s-v>', '<c-r><c-o>+', opts_sl)
keymap('i', '<s-insert>', '<c-r><c-o>+', opts_sl)

keymap('c', '<c-s-v>', '<c-r><c-o>+', opts)
keymap('c', '<s-insert>', '<c-r><c-o>+', opts)

-- visual mode
keymap('v', '<c-c>', '"+y', opts_sl)
keymap('v', '<c-x>', '"+x', opts_sl)

-- terminal mode
keymap('t', '<c-h>', '<c-w>', opts_sl)
keymap('t', '<c-n>', '<c-\\><c-n>', opts_sl)
keymap('t', '<c-w>', '<c-\\><c-n><c-w>', opts_sl)

-- normal mode
keymap('n', 'Q', ':q!<cr>', opts_sl)
keymap('n', 'X', ':x<cr>', opts_sl)

keymap('n', '<a-j>', '<c-]>', opts_sl)
keymap('n', '<a-k>', '<c-t>', opts_sl)

keymap('n', '<c-t>', ':tabe<cr>', opts_sl)
keymap('n', '<s-t>', ':tab sp<cr>', opts_sl)
keymap('n', '<c-n>', ':tabe .<cr>', opts_sl)
keymap('n', '<a-h>', ':tabp<cr>', opts_sl)
keymap('n', '<a-l>', ':tabn<cr>', opts_sl)

keymap('n', '<a-left>', ':tabp<cr>', opts_sl)
keymap('n', '<a-right>', ':tabn<cr>', opts_sl)

keymap('n', '<a-s-h>', ':tabm -1<cr>', opts_sl)
keymap('n', '<a-s-l>', ':tabm +1<cr>', opts_sl)
keymap('n', '<a-s-left>', ':tabm -1<cr>', opts_sl)
keymap('n', '<a-s-right>', ':tabm +1<cr>', opts_sl)

for i = 1, 9 do
  keymap('n', '<a-' .. i .. '>', ':tabn ' .. i .. '<cr>', opts_sl)
end

keymap('n', '<a-0>', '', {
  callback = function()
    local tab = vim.api.nvim_exec('echo tabpagenr("$")', true)
    vim.cmd('tabn ' .. tab)
  end
})

keymap('n', '<esc>', ':nohl<cr>', opts_sl)
keymap('n', '<c-j>', ':res +5<cr>', opts_sl)
keymap('n', '<c-k>', ':res -5<cr>', opts_sl)
keymap('n', '<c-h>', ':vert res +5<cr>', opts_sl)
keymap('n', '<c-l>', ':vert res -5<cr>', opts_sl)

keymap('n', ';rl', ':so ~/flake/modules/home/nvim/config/init.lua<cr>', opts_sl)
keymap('n', ';rc', ':e ~/flake/modules/home/nvim/config/init.lua<cr>', opts_sl)
keymap('n', ';s', ':e ~/flake/modules/home/nvim/config/lua/settings/options.lua<cr>', opts_sl)
keymap('n', ';m', ':e ~/flake/modules/home/nvim/config/lua/settings/maps.lua<cr>', opts_sl)
keymap('n', ';l', ':e ~/flake/modules/home/nvim/config/lua/lsp/lsp.lua<cr>', opts_sl)
keymap('n', ';id', ':e ~/flake/modules/home/nvim/config/lua/settings/indent.lua<cr>', opts_sl)

keymap('n', ';fs', ':set foldmethod=syntax<cr>', opts_sl)
keymap('n', ';fm', ':set foldmethod=manual<cr>', opts_sl)
keymap('n', '<cr>', [[ foldlevel('.') > 0 ? 'za' : 'j' ]], { expr = true })

keymap('n', ';cl', ':ColorToggle<cr>', opts_sl)
keymap('n', ';tv', ':bel vs term://fish<cr>', opts_sl)
keymap('n', ';tt', ':bel sp term://fish <bar> resize 14<cr>', opts_sl)
keymap('n', ';vi', [[ &keymap == '' ? ':set keymap=vietnamese-vni<cr>' : ':set keymap=<cr>' ]], { expr = true })

keymap('n', '<f2>', ':lua vim.lsp.buf.rename()<cr>', opts)
keymap('n', '<s-k>', ':lua vim.lsp.buf.hover()<cr>', opts_sl)
keymap('n', '<c-f>', ':lua vim.lsp.buf.format({ async = false })<cr>', opts_sl)
keymap('n', '<c-m>', ':lua vim.lsp.buf.code_action({ apply = true })<cr>', opts_sl)
keymap('n', '<s-l>', ':lua vim.lsp.buf.definition({ reuse_win = true })<cr>', opts_sl)

keymap('n', 'f', ':lua vim.diagnostic.open_float()<cr>', opts_sl)
keymap('n', ']g', ':lua vim.diagnostic.goto_next()<cr>', opts_sl)
keymap('n', '[g', ':lua vim.diagnostic.goto_prev()<cr>', opts_sl)


keymap('n', '<c-i>', '', {
  callback = function()
    vim.lsp.buf.execute_command({
      command = '_typescript.organizeImports',
      arguments = { vim.api.nvim_buf_get_name(0) },
    })
  end,
})

keymap('n', 'gf', ':GitGutterFold<cr>', opts)
keymap('n', 'gl', ':call gitblame#echo()<cr>', opts_sl)
