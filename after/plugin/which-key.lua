local wk = require("which-key")
wk.register({
  -- Đối với Telescope
  t = {
    name = "Telescope",
    f = { "<CMD>lua require('telescope.builtin').find_files()<CR>", "Find Files" },
    g = { "<CMD>lua require('telescope.builtin').live_grep()<CR>", "Live Grep" },
    b = { "<CMD>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
    h = { "<CMD>lua require('telescope.builtin').help_tags()<CR>", "Help Tags" },
    s = { "<CMD>lua require('telescope.builtin').git_status()<CR>", "Git Status" },
    c = { "<CMD>lua require('telescope.builtin').git_commits()<CR>", "Git Commits" },
  },
  --leader
  ['<leader>'] = {
    --save
    w = { "<CMD>update<CR>", "Save" }, 
    --quit
    q = { "<CMD>q<CR>", "Quit" },
    -- Windows
    v = { "<CMD>vsplit<CR>", "Vertical Split" },
    h = { "<CMD>split<CR>", "Horizontal Split" },
    --comment
    ['/'] = { "gcc", "Comment" },
    --
    -- r = {"<CMD>MurenToggle<CR>", "Search and Replace"}
    
  },
  -- NeoTree
  e = { "<CMD>Neotree toggle<CR>", "Toggle NeoTree" },
  o = { "<CMD>Neotree focus<CR>", "Focus NeoTree" },

  -- Buffer
  ['<TAB>'] = { "<CMD>bnext<CR>", "Next Buffer" },
  ['<S-TAB>'] = { "<CMD>bprevious<CR>", "Previous Buffer" },

  -- Markdown Preview
  m = { "<CMD>MarkdownPreview<CR>", "Markdown Preview" },
  mn = { "<CMD>MarkdownPreviewStop<CR>", "Stop Markdown Preview" },

  -- Window Navigation
  ['<C-h>'] = { "<C-w>h", "Navigate Left" },
  ['<C-l>'] = { "<C-w>l", "Navigate Right" },
  ['<C-k>'] = { "<C-w>k", "Navigate Up" },
  ['<C-j>'] = { "<C-w>j", "Navigate Down" },

  -- Resize Windows
  ['<C-Left>'] = { "<C-w><", "Resize Left" },
  ['<C-Right>'] = { "<C-w>>", "Resize Right" },
  ['<C-Up>'] = { "<C-w>+", "Resize Up" },
  ['<C-Down>'] = { "<C-w>-", "Resize Down" },
})