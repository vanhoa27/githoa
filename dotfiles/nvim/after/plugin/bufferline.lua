local status, bufferline = pcall(require, "bufferline")
if not status then
    return
end

bufferline.setup({
    options = {
        mode = "tabs",       -- "buffers" to show buffers as tabs
        numbers = "ordinal", -- display buffer_id, or both to display buffer_id and ordinal
        buffer_close_icon = "",
        -- separator_style = "thin",
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_tab_indicators = false,
        show_close_icon = false,
        color_icons = true,
        close_icon = "",
        modified_icon = "●",
    },
})
