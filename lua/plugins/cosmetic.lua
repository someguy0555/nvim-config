return {
	{
		'ellisonleao/gruvbox.nvim',
		version = false,
		config = function()
			require("gruvbox").setup({ invert_selection = true, })
			vim.cmd('colorscheme gruvbox')
		end,
	},
    -- { 'catppuccin/nvim', },
    -- { 'folke/tokyonight.nvim', },
    -- { 'EdenEast/nightfox.nvim', },
    -- { 'rose-pine/neovim', },
    -- { 'navarasu/onedark.nvim', },
    -- { 'savq/melange-nvim', },
    -- { 'vague2k/vague.nvim', },
}
