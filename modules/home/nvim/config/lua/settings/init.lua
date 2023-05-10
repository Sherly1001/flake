-- vi: sw=2 ts=2

local m = {
  'settings.funcs',
  'settings.options',
  'settings.maps',
  'settings.indent',
  'lsp',
}

for i = 1, #m do
  package.loaded[m[i]] = nil
  require(m[i])
end
