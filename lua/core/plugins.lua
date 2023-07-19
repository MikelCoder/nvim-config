local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = {'nvim-lua/plenary.nvim'}
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
		}
	},

    {"williamboman/mason.nvim", build = ":MasonUpdate"},

	{'nvim-treesitter/nvim-treesitter'},

    {'joshdick/onedark.vim'},
    {'Shatur/neovim-ayu'},
    {'xiyaowong/transparent.nvim'},
    {"lukas-reineke/virt-column.nvim"},

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim'
        }},

    {'neovim/nvim-lspconfig'}, {'ErichDonGubler/lsp_lines.nvim'},

    {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'}, {'lewis6991/gitsigns.nvim'},

    {"akinsho/bufferline.nvim", dependencies = {'nvim-tree/nvim-web-devicons'}},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {'jose-elias-alvarez/null-ls.nvim'},
    {'windwp/nvim-autopairs'},
    {'terrortylor/nvim-comment'},
});
