return {
	{
		'ellisonleao/gruvbox.nvim',
		version = false,
		config = function()
			require("gruvbox").setup({ invert_selection = true, })
			vim.cmd('colorscheme gruvbox')
		end,
	},
}
