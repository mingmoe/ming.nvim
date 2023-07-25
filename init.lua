
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
vim.opt.swapfile = true
vim.opt.bufhidden = "unload" 
vim.opt.backup = true

-- set up terminal 
vim.opt.termguicolors = true 
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.termencoding = "utf-8"

-- set up others
vim.opt.number = true 
vim.opt.relativenumber = true 
vim.opt.cursorline = true 
vim.opt.ignorecase = true 
vim.opt.smartcase = true 
-- vim.opt.cursorcolumn = true

-- set up neovim
if vim.g.neovide then
    vim.o.guifont = "JetBrains Mono:h13"
    vim.opt.linespace = 1
    vim.g.neovide_transparency = 0.9
    vim.g.neovide_cursor_vfx_mode = "railgun"
end

