---@type vim.lsp.Config
return {
  root_markers = {'tsconfig.json', 'package.json', 'jsconfig.json', '.git'},
  cmd = { 'vtsls', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  single_file_support = true,
}
