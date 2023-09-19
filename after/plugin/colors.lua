function ColorMyPencils(color)
	color = color or "tokyonight-night"
	vim.cmd.colorscheme(color)

	--MAKE BACKGROUND TRANSPARENT
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
