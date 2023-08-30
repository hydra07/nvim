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
-- Hàm thêm tệp tin mới
local function add_new_file(prompt_bufnr)
  local file_path = actions.get_selected_entry(prompt_bufnr).path
  vim.fn.system("touch " .. file_path)
end

-- Hàm xóa tệp tin
local function delete_file(prompt_bufnr)
  local file_path = actions.get_selected_entry(prompt_bufnr).path
  vim.fn.delete(file_path)
end

-- Hàm đổi tên tệp tin
local function rename_file(prompt_bufnr)
  local file_path = actions.get_selected_entry(prompt_bufnr).path
  local new_name = vim.fn.input("Enter new file name: ", "", "file")
  if new_name ~= "" then
    local new_path = vim.fn.expand("%:p:h") .. "/" .. new_name
    vim.fn.rename(file_path, new_path)
  end
end
-- Hàm thêm folder mới
local function add_new_folder(prompt_bufnr)
  local folder_path = actions.get_selected_entry(prompt_bufnr).path
  local new_folder_name = vim.fn.input("Enter new folder name: ")
  if new_folder_name ~= "" then
    local new_folder_path = folder_path .. "/" .. new_folder_name
    vim.fn.mkdir(new_folder_path, "p")
  end
end
-- Hàm xóa folder
local function delete_folder(prompt_bufnr)
  local folder_path = actions.get_selected_entry(prompt_bufnr).path
  vim.fn.delete(folder_path, "rf")
end

-- Hàm đổi tên folder
local function rename_folder(prompt_bufnr)
  local folder_path = actions.get_selected_entry(prompt_bufnr).path
  local new_name = vim.fn.input("Enter new folder name: ")
  if new_name ~= "" then
    local parent_folder = vim.fn.fnamemodify(folder_path, ":h")
    local new_folder_path = parent_folder .. "/" .. new_name
    vim.fn.rename(folder_path, new_folder_path)
  end
end
-- Thiết lập các tùy chọn cho Telescope
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

-- Tải và sử dụng tiện ích mở rộng file_browser của Telescope
telescope.load_extension("file_browser")

-- Thiết lập which-key mappings cho Telescope
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
        -- mappings = {
        --   n = {
        --     ["<CR>"] = actions.select_default,
        --     ["a"] = add_new_file,
        --     ["d"] = delete_file,
        --     ["r"] = rename_file,
        --     ["A"] = add_new_folder,
        --     ["D"] = delete_folder,
        --     ["R"] = rename_folder,
        --   },
        -- },
      })
    end,
    "Show File Browser",

  },
})
