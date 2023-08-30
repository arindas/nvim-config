-- Set colorscheme

local colorscheme = "base16-material-darker"

---@diagnostic disable-next-line: param-type-mismatch
local status_ok_1, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok_1 then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

vim.cmd([[hi Comment guifg=#6a6a6a]])
vim.cmd([[hi VertSplit guifg=#353535]])

vim.cmd([[hi TSComment guifg=#6a6a6a]])

vim.cmd([[hi NvimTreeNormal guibg=#1a1a1a]])
vim.cmd([[hi NvimTreeNormalFloat guibg=#1a1a1a]])
vim.cmd([[hi NvimTreeWinSeparator guifg=bg]])

vim.cmd([[hi LineNr guifg=#4a4a4a]])
vim.cmd([[hi CursorLineNr guibg=bg]])

local status_ok_2, rainbow_delimiters = pcall(require, 'rainbow-delimiters')
if status_ok_2 then
    vim.g.rainbow_delimiters = {
        strategy = {
            [''] = rainbow_delimiters.strategy['global'],
            vim = rainbow_delimiters.strategy['local'],
        },
        query = {
            [''] = 'rainbow-delimiters',
            lua = 'rainbow-blocks',
        },
        highlight = {
            'RainbowDelimiterYellow',
            'RainbowDelimiterOrange',
            'RainbowDelimiterGreen',
            'RainbowDelimiterCyan',
            'RainbowDelimiterBlue',
            'RainbowDelimiterViolet',
            'RainbowDelimiterRed',
        },
    }

    vim.cmd([[hi RainbowDelimiterRed guifg=#f07178]])
    vim.cmd([[hi RainbowDelimiterYellow guifg=#ffcb6b]])
    vim.cmd([[hi RainbowDelimiterBlue guifg=#82aaff]])
    vim.cmd([[hi RainbowDelimiterOrange guifg=#f78c6c]])
    vim.cmd([[hi RainbowDelimiterGreen guifg=#c3e88d]])
    vim.cmd([[hi RainbowDelimiterViolet guifg=#c792ea]])
    vim.cmd([[hi RainbowDelimiterCyan guifg=#89ddff]])
end



vim.cmd([[highlight! link TelescopeSelection    Visual]])
vim.cmd([[highlight! link TelescopeNormal       Normal]])
vim.cmd([[highlight! link TelescopePromptNormal TelescopeNormal]])
vim.cmd([[highlight! link TelescopeBorder       TelescopeNormal]])
vim.cmd([[highlight! link TelescopePromptBorder TelescopeBorder]])
vim.cmd([[highlight! link TelescopeTitle        TelescopeBorder]])
vim.cmd([[highlight! link TelescopePromptTitle  TelescopeTitle]])
vim.cmd([[highlight! link TelescopeResultsTitle TelescopeTitle]])
vim.cmd([[highlight! link TelescopePreviewTitle TelescopeTitle]])
vim.cmd([[highlight! link TelescopePromptPrefix Identifier]])

vim.cmd([[highlight! LspInfoBorder guifg=#ffffff]])

vim.cmd([[hi FocusedSymbol guifg=fg guibg=#353535]])

vim.fn.sign_define('DapBreakpoint', {
    text = '',
    texthl = 'DapBreakpoint',
    linehl = 'DapBreakpoint',
    numhl = 'DapBreakpoint'
})
vim.fn.sign_define('DapBreakpointCondition',
    { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected',
    { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
