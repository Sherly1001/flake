-- vi: sw=2 ts=2

local lspstt = require('lsp.status')

Funcs = {}

local function modified(bufnr)
  return vim.fn.getbufvar(bufnr, '&modified') == 1
end

local function title(bufnr)
  local name = vim.fn.bufname(bufnr)
  local filename = name == '' and '[No Name]' or vim.fn.fnamemodify(name, ':t')
  if #filename > 15 then
    filename = filename:sub(1, 10) .. '..' .. vim.fn.fnamemodify(name, ':e')
  end
  return filename
end

local function evaltab(tab)
  tab = tab:gsub('%%#[^#]+#', '')
  tab = tab:gsub('%%%d*[TX]', '')
  return tab
end

function Funcs.tabline()
  local numtab = vim.fn.tabpagenr('$')
  local curtab = vim.fn.tabpagenr()
  local pertab = numtab > 1 and (curtab .. '/' .. numtab) or ''
  local cols = vim.o.columns

  local tabs = {}
  for tab = 1, numtab do
    local wins = vim.fn.tabpagewinnr(tab)
    local bufs = vim.fn.tabpagebuflist(tab)
    local bufnr = bufs[wins]

    local tabname = tab == curtab and '%#TabLineSel#' or '%#TabLine#'
    tabname = tabname .. '%' .. tab .. 'T '
    tabname = tabname .. title(bufnr)
    tabname = tabname .. (modified(bufnr) and ' •' or '')
    tabname = tabname .. ' %T'

    table.insert(tabs, tabname)
  end

  local tabline = tabs[curtab]
  local is_left = true
  local left = curtab - 1
  local right = curtab + 1

  while left > 0 or right <= numtab do
    local next = tabline

    if is_left and left > 0 then
      next = tabs[left] .. tabline
      left = left - 1
    elseif not is_left and right <= numtab then
      next = tabline .. tabs[right]
      right = right + 1
    end

    if #(evaltab(next) .. pertab) > cols then
      break
    else
      tabline = next
    end

    is_left = not is_left
  end

  return '%#TabLineFill#' .. tabline .. '%#TabLineFill#' .. '%=' .. pertab
end

function Funcs.stt()
  return '%f%=' .. lspstt() .. ' %y%r %-14(%3c-%l/%L%)%P'
end

function Funcs.fontsize(step)
  step = step or 1
  local font = vim.api.nvim_exec('echo &guifont', true)
  if #font < 1 then return end
  local ff = vim.split(font, ':h')
  local new = ff[1] .. ':h' .. (ff[2] + step)
  vim.cmd('set guifont=' .. new)
end
