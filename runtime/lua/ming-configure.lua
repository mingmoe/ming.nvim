
----------------------
-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
})
end

vim.opt.rtp:prepend(lazypath)

------------------
-- setup lazy.nvim
require("lazy").setup({
    {
        "nvim-lua/plenary.nvim"
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
     "folke/trouble.nvim",
     dependencies = { "nvim-tree/nvim-web-devicons" },
     -- NONE currently
     opts = {}
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {}
    },
    -- TODO: configure nvim lspconfig
    {
        "neovim/nvim-lspconfig"
    },
    -- TODO: configure lua ship
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'hrsh7th/cmp-buffer'
    },
    {
        'hrsh7th/cmp-path'
    },
    {
        'hrsh7th/cmp-cmdline'
    },
    {
        "navarasu/onedark.nvim"
    },
    {
        "hrsh7th/nvim-cmp"
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }
})

-----------------
-- set up lualine
require('lualine').setup(
{
    options = {
        theme = 'onedark'
    }
})
------------------
-- set up neo tree
require("neo-tree").setup({})
vim.keymap.set("n","<leader>tree",function()
    vim.cmd [[ Neotree ]]
end, { desc = "open neo-file-tree"})

----------------------
-- set up theme
require('onedark').setup {
    style = 'warm'
}
require('onedark').load()

-----------------
-- set up trouble
vim.keymap.set("n","<leader>tb",function()
    vim.cmd [[ TodoTrouble ]] -- activate todo in trouble
    require("trouble").open()
end, { desc = "call up trouble" })

vim.keymap.set("n", "<leader>n", function()
    require("trouble").next({skip_groups = true, jump = true})
end, { desc = "Next todo comment" })

vim.keymap.set("n", "<leader>p", function()
    require("trouble").previous({skip_groups = true, jump = true});
end, { desc = "Previous todo comment" })

------------------
-- set up nvim-cmp
local cmp = require('cmp')

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-k>'] = cmp.mapping.scroll_docs(-4),
  ['<C-j>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-x>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'luasnip' }, -- For luasnip users.
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
-- capabilities = capabilities
-- }

------------------
-- set up key maps
vim.cmd [[ nnoremap <F3> :set hlsearch!<CR> ]]

-- for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations , {})


-- todo comments with telescope
vim.keymap.set("n","<leader>ft",function()
    vim.cmd [[ TodoTelescope ]]
end, { desc = "Telescope with todo comments"})

------------------
-- set up convenient function to lsp
local nvim_lsp = require('lspconfig')

--------------------------
-- help command for myself
vim.api.nvim_create_user_command(
    "ConfigureProjectHere",
    function(opts)
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("MoeProject").setup({
                capabilities = capabilities
        })
        require("MoeProject").update()
        vim.cmd [[ autocmd BufWrite * UpdateProject ]]
    end,
    { nargs = 0 })

vim.api.nvim_create_user_command(
    "UpdateProject",
    function(opts)
        require("MoeProject").update()
    end,
    { nargs = 0 })

-------------------------
-- add a filetype for c++
vim.filetype.add({
    extension = {
        cppm = "cpp"
    }
})

