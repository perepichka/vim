-- LUA NeoVim config, for now only for the stuff not in the .vimrc
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" }
}

if vim.fn.has('win32') or vim.fn.has('win64') then
    require("dap-python").setup('C:/Users/mperepichka/AppData/Local/miniconda3/python.exe')
else
    require("dap-python").setup('/home/mperepichka/miniconda3/envs/py38/bin/python')
end
require("dapui").setup({})

local dap = require("dap")
local dap_python = require("dap-python")
local dapui = require("dapui")

dap.set_log_level("TRACE")

require("nvim-dap-virtual-text").setup({
commented = true, -- Show virtual text alongside comment
})

vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
    text = "", -- or "❌"
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
})

vim.fn.sign_define("DapStopped", {
    text = "", -- or "→"
    texthl = "DiagnosticSignWarn",
    linehl = "Visual",
    numhl = "DiagnosticSignWarn",
})


vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
local widgets = require('dap.ui.widgets')
widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
local widgets = require('dap.ui.widgets')
widgets.centered_float(widgets.scopes)
end)

--local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
require('dapui').open()
end
dap.listeners.before.launch.dapui_config = function()
require('dapui').open()
end
dap.listeners.before.event_terminated.dapui_config = function()
require('dapui').close()
end
dap.listeners.before.event_exited.dapui_config = function()
require('dapui').close()
end
