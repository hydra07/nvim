-- Load which-key plugin
require("which-key").setup {}

-- Load Telescope plugin
local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
local fb_actions = require "telescope".extensions.file_browser.actions

-- Hàm lấy đường dẫn thư mục của buffer
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end,
          ["<C-u>"] = function(prompt_bufnr)
            for i = 1, 10 do actions.move_selection_previous(prompt_bufnr) end
          end,
          ["<C-d>"] = function(prompt_bufnr)
            for i = 1, 10 do actions.move_selection_next(prompt_bufnr) end
          end,
          ["<PageUp>"] = actions.preview_scrolling_up,
          ["<PageDown>"] = actions.preview_scrolling_down,
        },
      },
    },
  },
}

telescope.load_extension("file_browser")
require("which-key").register({
  ["<leader>tf"] = { builtin.find_files, "Find Files" },
  [";r"] = { builtin.live_grep, "Live Grep" },
  ["\\\\"] = { builtin.buffers, "Buffers" },
  [";t"] = { builtin.help_tags, "Help Tags" },
  [";;"] = { builtin.resume, "Resume" },
  [";e"] = { builtin.diagnostics, "Diagnostics" },
  ["<leader>e"] = {
    function()
      telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 },
      })
    end,
    "Show File Browser",

  },
})
