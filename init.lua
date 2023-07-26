
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set up indent
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

-- set up tab
vim.opt.smarttab = true
vim.opt.expandtab = true
-- -- four is a virtue
vim.opt.shiftwidth = 4 
vim.opt.softtabstop = 4 
vim.opt.tabstop = 4 

-- set up swapfile and backer
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = false

-- set up terminal 
vim.opt.termguicolors = true 
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.termencoding = "utf-8"
vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes" 

-- set up others
vim.opt.number = true 
vim.opt.relativenumber = true 
vim.opt.cursorline = true 
vim.opt.ignorecase = true 
vim.opt.smartcase = true 
vim.opt.updatetime = 300
-- vim.opt.cursorcolumn = true

-- set up neovide
if vim.g.neovide then
    vim.o.guifont = "JetBrains Mono:h13"
    vim.opt.linespace = 1
    vim.g.neovide_transparency = 0.9
    vim.g.neovide_cursor_vfx_mode = "railgun"
end

vim.cmd([[
aunmenu PopUp.How-to\ disable\ mouse
aunmenu PopUp.-1-
]])

-- set up plugin
vim.opt.runtimepath:prepend(#RUNTIME_PATH#)

require("ming-plugins")
require("ming-coc")


