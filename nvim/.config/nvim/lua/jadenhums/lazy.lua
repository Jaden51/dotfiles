local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {
        {
            'nvim-telescope/telescope.nvim',
            branch = 'master',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        -- searching files
        {
            'nvim-telescope/telescope-ui-select.nvim'
        },
        -- themes
        {
            'rebelot/kanagawa.nvim'
        },
        {
            'rose-pine/neovim'
        },
        -- parsing syntax trees for colour
        {
            'nvim-treesitter/nvim-treesitter', branch = 'main', lazy = false, build = ':TSUpdate'
        },
        -- better lua
        {
            'nvim-lua/plenary.nvim'
        },
        -- file marking
        {
            'ThePrimeagen/harpoon'
        },
        -- undo tree
        {
            'mbbill/undotree'
        },
        -- git wrapper
        {
            'tpope/vim-fugitive'
        },
        -- lsp
        {
            'neovim/nvim-lspconfig'
        },
        -- auto complete
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
            'hrsh7th/nvim-cmp'
        },
        -- herdr
        { 
            "ChmaraX/herdr-nvim", opts = {} 
        },
        -- log highlighting
        {
            "fei6409/log-highlight.nvim",
            config = function()
                require("log-highlight").setup({})
            end,
        },
        {
          "selimacerbas/mdkite.nvim",
          dependencies = { "selimacerbas/kitehost.nvim" },
          config = function()
            require("mdkite").setup({
              -- all optional; sane defaults shown
              instance_mode = "takeover",  -- "takeover" (one tab) or "multi" (tab per instance)
              port = 0,                    -- 0 = auto (8421 for takeover, OS-assigned for multi)
              open_browser = true,
              default_theme = "dark",      -- "dark" or "light"; initial preview theme
              debounce_ms = 300,
            })
          end,
        },
        {
            import = "jadenhums.plugins"
        }
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true, notify = false },
})

