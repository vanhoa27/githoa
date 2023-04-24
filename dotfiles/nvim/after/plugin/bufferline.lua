local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		mode = "tabs", -- "buffers" to show buffers as tabs
		numbers = "ordinal", -- display buffer_id, or both to display buffer_id and ordinal
		buffer_close_icon = "",
		separator_style = "padded_slant",
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = true,
		color_icons = true,
		close_icon = "",
		modified_icon = "●",
	},
	-- highlights = {
	-- 	separator = {
	-- 		fg = "#073642",
	-- 		bg = "#002b36",
	-- 	},
	-- 	separator_selected = {
	-- 		fg = "#073642",
	-- 	},
	-- 	background = {
	-- 		fg = "#657b83",
	-- 		bg = "#002b36",
	-- 	},
	-- 	buffer_selected = {
	-- 		fg = "#fdf6e3",
	-- 		bold = true,
	-- 	},
	-- 	fill = {
	-- 		bg = "#073642",
	-- 	},
	-- },
})

