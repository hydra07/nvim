local wk = require("which-key")
wk.register({
  ["<leader>xx"] = { "<Cmd>lua require('trouble').open()<CR>", "Trouble" },
  ["<leader>xw"] = { "<Cmd>lua require('trouble').open('workspace_diagnostics')<CR>", "Workspace Diagnostics" },
  ["<leader>xd"] = { "<Cmd>lua require('trouble').open('document_diagnostics')<CR>", "Document Diagnostics" },
  ["<leader>xq"] = { "<Cmd>lua require('trouble').open('quickfix')<CR>", "Quickfix" },
  ["<leader>xl"] = { "<Cmd>lua require('trouble').open('loclist')<CR>", "Location List" },
  ["gR"] = { "<Cmd>lua require('trouble').open('lsp_references')<CR>", "LSP References" },
  --lsp
  g ={
    D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Go to Declaration" },
    d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
    I = { "<Cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation" },
    K = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Show Hover Information" },
    G = { "<Cmd>norm! G<CR>", "Last Line" },
    
  },

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
    l = { "<CMD>Lspsaga outline<CR>", "Show Outline" },
    --save
    w = { "<CMD>update<CR>", "Save" }, 
    --quit
    q = { "<CMD>q<CR>", "Quit" },
    -- Windows
    v = { "<CMD>vsplit<CR>", "Vertical Split" },
    h = { "<CMD>split<CR>", "Horizontal Split" },
    --comment
    -- ['/'] = { "gcc", "Comment" },
    --
    -- r = {"<CMD>MurenToggle<CR>", "Search and Replace"}
    t = {
      h = {"<CMD>split term://$SHELL<CR>", "Horizontal Terminal"},
      v = {"<CMD>vsplit term://$SHELL<CR>", "Vertical Terminal"},
    },
    k = {"<cmd>Lspsaga hover_doc<CR>", "Hover Doc"},
    
  },
  -- NeoTree
  -- e = { "<CMD>Neotree toggle<CR>", "Toggle NeoTree" },
  -- o = { "<CMD>Neotree focus<CR>", "Focus NeoTree" },

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