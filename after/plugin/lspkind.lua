local lspkind = require("lspkind")


lspkind.init({
  -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
  mode = 'symbol_text',
  -- default: 'default'
  preset = 'codicons',
  -- default: {}
  symbol_map = {
    Text = "", -- Hiển thị biểu tượng cho kiểu 'Text'
    Method = "", -- Hiển thị biểu tượng cho kiểu 'Method'
    Function = "", -- Hiển thị biểu tượng cho kiểu 'Function'
    Constructor = "", -- Hiển thị biểu tượng cho kiểu 'Constructor'
    Field = "", -- Hiển thị biểu tượng cho kiểu 'Field'
    Variable = "", -- Hiển thị biểu tượng cho kiểu 'Variable'
    Class = "", -- Hiển thị biểu tượng cho kiểu 'Class'
    Interface = "ﰮ", -- Hiển thị biểu tượng cho kiểu 'Interface'
    Module = "", -- Hiển thị biểu tượng cho kiểu 'Module'
    Property = "", -- Hiển thị biểu tượng cho kiểu 'Property'
    Unit = "塞", -- Hiển thị biểu tượng cho kiểu 'Unit'
    Value = "", -- Hiển thị biểu tượng cho kiểu 'Value'
    Enum = "", -- Hiển thị biểu tượng cho kiểu 'Enum'
    Keyword = "", -- Hiển thị biểu tượng cho kiểu 'Keyword'
    Snippet = "", -- Hiển thị biểu tượng cho kiểu 'Snippet'
    Color = "", -- Hiển thị biểu tượng cho kiểu 'Color'
    File = "", -- Hiển thị biểu tượng cho kiểu 'File'
    Reference = "", -- Hiển thị biểu tượng cho kiểu 'Reference'
    Folder = "", -- Hiển thị biểu tượng cho kiểu 'Folder'
    EnumMember = "", -- Hiển thị biểu tượng cho kiểu 'EnumMember'
    Constant = "", -- Hiển thị biểu tượng cho kiểu 'Constant'
    Struct = "פּ" -- Hiển thị biểu tượng cho kiểu 'Struct'
  }
})
