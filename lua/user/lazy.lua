-- Bootstrap lazy.nvim during initialization.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- The "plugins" table defines what plugins we want lazy.nvim to load/install.
local plugins = {
    -- Colour scheme. Have this loaded and installed first so that we can have
    -- the colour scheme available immediately. Any additional colour schemes
    -- can be added below to lazy-loaded when needed/wanted.
    {
        "rebelot/kanagawa.nvim",
        lazy = false,       -- Make sure it's loaded on startup.
        priority = 1000,    -- Make sure it's one of the first plugins loaded.
        config = function() -- Apply the colorscheme once it's loaded.
            vim.cmd("colorscheme kanagawa-dragon")
        end,
    },

    -- Completion and LSP tools.
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },

    { "L3MON4D3/LuaSnip" },

    -- Ease-of-use plugins.
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
    },
    { "numToStr/Comment.nvim" },
    { "NvChad/nvim-colorizer.lua" },

    -- Project navigation and management.
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Tree-sitter for better syntax highlighting.
    { "nvim-treesitter/nvim-treesitter", },
}

-- Finally, initialize lazy.nvim.
local opts = {
    defaults = {
        -- lazy = true,
        lazy = false,
    },
}

require("lazy").setup(plugins, opts)

