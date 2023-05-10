-- vi: sw=2 ts=2

local m = {
  'lsp.lsp-cfg',
}

for i = 1, #m do
  package.loaded[m[i]] = nil
  require(m[i])
end
