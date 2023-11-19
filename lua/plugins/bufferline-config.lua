local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    -- mode = "tabs",
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    color_icons = true,
    indicator = {
      -- icon = " 喇",
      style = "icon"
    },
    close_icon = '',
    diagnostics = "nvim_lsp",
    -- separator_style =  "slant" ,
    show_tab_indicators = true,
    buffer_close_icon = "",
    diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or ""
        return " " .. icon .. count
    end
  },
})
vim.g.icons_enabled = true
