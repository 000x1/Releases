local util = require 'lspconfig.util'

local cmd = { 'buck2', 'lsp' }
if vim.fn.has 'win32' == 1 then
  cmd = { 'cmd.exe', '/C', 'buck2', 'lsp' }
end

return {
  default_config = {
    cmd = cmd,
    filetypes = { 'bzl' },
    root_dir = function(fname)
      return util.root_pattern '.buckconfig'(fname)
    end,
  },
  docs = {
    description = [=[
https://github.com/facebook/buck2

Build system, successor to Buck

To better detect Buck2 project files, the following can be added:

```
vim.cmd [[ autocmd BufRead,BufNewFile *.bxl,BUCK,TARGETS set filetype=bzl ]]
```
]=],
    default_config = {
      root_dir = [[root_pattern(".buckconfig")]],
    },
  },
}
