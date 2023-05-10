local signs = {
  error = '',
  warn = '',
  hint = '',
  info = '',

  installed = '✓',
  pending = '➜',
  uninstalled = '✗',

  color_error = '%#DiagnosticError#',
  color_warn = '%#DiagnosticWarn#',
  color_hint = '%#DiagnosticHint#',
  color_info = '%#DiagnosticInfo#',
  color_normal = '%#StatusLine#',
}

signs.error_cl = signs.color_error .. signs.error .. signs.color_normal
signs.warn_cl = signs.color_warn .. signs.warn .. signs.color_normal
signs.hint_cl = signs.color_hint .. signs.hint .. signs.color_normal
signs.info_cl = signs.color_info .. signs.info .. signs.color_normal

return signs;
