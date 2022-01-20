local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

treesitter.setup {
  ensure_installed = "maintained",
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = false
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int

    colors = {
      "#ffcb6b",
      "#f78c6c",
      "#c3e88d",
      "#89ddff",
      "#82aaff",
      "#c792ea",
      "#f07178",
    }, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
