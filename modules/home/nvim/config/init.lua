local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- utils plugins
Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && yarn install' })
Plug 'lervag/vimtex'

-- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

-- LSP completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/nvim-cmp'

-- LSP snippet
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'mattn/emmet-vim'

Plug('xianghongai/vscode-react-snippet', { ['do'] = 'yarn install || yarn build || true ' })

-- LSP status line
Plug 'nvim-lua/lsp-status.nvim'

-- base plugins
Plug 'chrisbra/Colorizer'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ctrlpvim/ctrlp.vim'

-- git plugins
Plug 'zivyangll/git-blame.vim'
Plug 'airblade/vim-gitgutter'

-- lang plugins
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'TovarishFin/vim-solidity'
Plug 'modocache/move.vim'
Plug 'ollykel/v-vim'

vim.call('plug#end')

package.loaded['settings'] = nil
require 'settings'
