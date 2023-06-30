-- vi: sw=2 ts=2

local g = vim.g
local opt = vim.opt

opt.number          = true
opt.relativenumber  = true

opt.smartcase       = true
opt.ignorecase      = true
opt.wildignorecase  = true

opt.cursorline = true

opt.hidden     = true
opt.compatible = false
opt.backup     = false
opt.undofile   = false
opt.swapfile   = false

opt.encoding = 'utf-8'

opt.mouse     = 'a'
opt.belloff   = 'all'
opt.backspace = '2'

opt.timeoutlen = 250
opt.updatetime = 100

opt.list = true
opt.listchars = 'tab:>-,trail:.'
opt.fillchars = 'vert: ,fold: '

opt.showtabline = 2
opt.tabline = '%!v:lua.Funcs.tabline()'
opt.statusline = '%!v:lua.Funcs.stt()'

vim.cmd [[ colorscheme onedark ]]

if g.neovide then
  g.neovide_cursor_antialiasing     = true
  g.neovide_cursor_animation_length = 0.13
  g.neovide_cursor_vfx_opacity      = 500.0
  g.neovide_cursor_vfx_mode         = 'railgun'
  g.neovide_cursor_vfx_particle_density = 10.0

  opt.guifont = 'Consolas:h9'
  vim.cmd [[ nn <silent> <c-=> :call v:lua.Funcs.fontsize()<cr> ]]
  vim.cmd [[ nn <silent> <c--> :call v:lua.Funcs.fontsize(-1)<cr> ]]
end

g.user_emmet_leader_key = ','

g.netrw_liststyle = 3
g.netrw_browser_split = 4

g.NERDTreeMinimalUI         =   true
g.NERDTreeMinimalMenu       =   true
g.NERDTreeShowHidden        =   true
g.NERDTreeShowLineNumbers   =   true
g.NERDTreeWinSize           =   24
g.NERDTreeStatusline        =   "%{''}"

g.rustfmt_options = "--edition 2021"

g.indent_guides_start_level = 2
g.indent_guides_guide_size  = 1

g.webdevicons_enable = 1
g.webdevicons_enable_nerdtree = 1

g.AutoPairsMapCh = 0

g.ctrlp_cmd = 'CtrlPMixed'
g.ctrlp_working_path_mode = 'ra'
g.ctrlp_show_hidden = true
g.ctrlp_open_multiple_files = 't'
g.ctrlp_user_command = 'rg --hidden --files %s'
g.ctrlp_prompt_mappings = {
  ['AcceptSelection("e")'] = {},
  ['AcceptSelection("t")'] = {'<cr>', '<2-LeftMouse>'},
}

g.CtrlSpaceUseTabline = 0
g.CtrlSpaceGlobCommand = 'rg --color=never --hidden --files'
g.CtrlSpaceDefaultMappingKey = '<C-Space> '
g.CtrlSpaceLoadLastWorkspaceOnStart = 1
g.CtrlSpaceSaveWorkspaceOnSwitch = 1
g.CtrlSpaceSaveWorkspaceOnExit = 1

g.vimtex_view_method = 'zathura'
g.vimtex_compiler_method = 'latexmk'
g.vimtex_compiler_latexmk = {
  build_dir = 'build',
  executable = 'latexmk',
  options = {
    '-xelatex',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  }
}
g.vimtex_compiler_latexmk_engines = {
  _ = ''
}

local au = {}

au['dynamic_startcase'] = {
  { 'CmdLineEnter', ':', 'set nosmartcase' },
  { 'CmdLineLeave', ':', 'set smartcase' },
}

au['leave_cursor'] = {
  { 'VimLeave', '*', 'sil! set gcr=a:hor20-blinkwait175-blinkoff150-blinkon175' },
}

au['terminal_mode'] = {
  { 'TermOpen', '*', 'setlocal statusline=%{b:term_title} | set nornu | set nonu' },
  { 'BufEnter', 'term://*', 'startinsert' },
  { 'TermClose', '*', ':q' },
}

au['check_file_changed'] = {
  { 'FocusGained', '*', ':checktime' },
}

for gr, cmds in pairs(au) do
  vim.api.nvim_create_augroup(gr, { clear = true })
  for i = 1, #cmds do
    vim.api.nvim_create_autocmd(cmds[i][1], {
      group = gr,
      pattern = cmds[i][2],
      command = cmds[i][3]
    })
  end
end
