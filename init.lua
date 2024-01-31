
-- disable vim file tree
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

-- set up indent
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

-- set up tab
vim.opt.smarttab = true
vim.opt.expandtab = true

-- two is a virtue
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- do not use swapfile and backer
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = false

-- set up terminal 
vim.opt.termguicolors = true 
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.termencoding = "utf-8"

-- have 12/8 lines space
vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 8

-- always draw a long line
vim.opt.signcolumn = "yes" 

-- show line numbers and highlight line
vim.opt.number = true 
vim.opt.relativenumber = true 
vim.opt.cursorline = true 

-- smart case when searching
vim.opt.ignorecase = true 
vim.opt.smartcase = true 

-- use light theme 
vim.o.background = 'dark'

-- auto save
vim.opt.updatetime = 300

-- Make sure to set `mapleader` before lazy so your mappings are correc
vim.g.mapleader = ","

-- set up plugin
-- will be replaced by compile.ps1
vim.opt.runtimepath:prepend(#RUNTIME_PATH#)
vim.g.ming_runtime_path = #RUNTIME_PATH#

require("ming-configure")

-- done
