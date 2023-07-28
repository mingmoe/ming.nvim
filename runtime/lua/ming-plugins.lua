
-- configure packer.nvim
vim.cmd [[ packadd packer.nvim ]] 

packer = require("packer")

packer.startup(function(use)
   use 'wbthomason/packer.nvim' 
   use {'neoclide/coc.nvim', branch = 'release'}
   use {
      'nvim-tree/nvim-tree.lua',
       requires = {
       'nvim-tree/nvim-web-devicons', -- optional
       },
   }
   use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use 'sainnhe/everforest'
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end}
    use {'stevearc/dressing.nvim'}
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
end)

-- vim.cmd [[ PackerSync ]]
-- auto close the file explorer 
-- 
-- 
--
-- set up nvim-tree
local function ming_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  -- api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n','n',api.fs.create,opts("Create"))
  vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
  vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
  vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
end
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = ming_on_attach
})

-- set key to open the tree
local api = require "nvim-tree.api"
vim.keymap.set('n',"<C-m>", api.tree.open)

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- set up the lualine
require('lualine').setup {
    options = {
       theme = 'everforest' 
    }
}

vim.api.nvim_create_user_command('MingUpdate',function()
vim.cmd [[ PackerSync ]]
vim.cmd [[ CocInstall coc-rust-analyzer ]]
-- vim.cmd [[ CocInstall coc-pairs ]]
vim.cmd [[ CocInstall coc-json ]]
vim.cmd [[ CocInstall coc-git ]]
-- vim.opt_global.coc_global_extensions = {'coc-json', 'coc-git','coc-pairs','coc-rust-analyzer' }
end,{})

vim.cmd [[
        " Important!!
        if has('termguicolors')
          set termguicolors
        endif

        " For dark version.
        " set background=dark

        " For light version.
        set background=light

        " Set contrast.
        " This configuration option should be placed before `colorscheme everforest`.
        " Available values: 'hard', 'medium'(default), 'soft'
        let g:everforest_background = 'soft'

        " For better performance
        let g:everforest_better_performance = 1

        colorscheme everforest
        ]]

require("toggleterm").setup{
autochdir = false,
open_mapping = [[<c-t>]],
direction = 'float',
size = 20,
shell = "pwsh"
}

require("bufferline").setup{
}

vim.cmd [[
nnoremap <silent><C-[> :BufferLineCycleNext<CR>
nnoremap <silent><C-]> :BufferLineCyclePrev<CR>
 ]]

