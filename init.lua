-- LUA NeoVim config, for now only for the stuff not in the .vimrc
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" }
}

if vim.fn.has('win32') or vim.fn.has('win64') then
    require("dap-python").setup('G:/conda/envs/research/python.exe')
else
    require("dap-python").setup('/home/mperepichka/miniconda3/envs/py38/bin/python')
end
require("dapui").setup({})

local dap = require("dap")
local dap_python = require("dap-python")
local dapui = require("dapui")

local python_path = vim.g.python3_host_prog

table.insert(dap.configurations.python, 
    {
        type = "python",
        request = "launch",
        name = "Train Material",
        program = "F:/DeepAsset/deepasset/deepasset/learn.py",
        console = "integratedTerminal",
        pythonPath = python_path,
        args = {
            "fit", "--config",
            "F:/DeepAsset/deepasset/config/material/train.yaml",
        }
    }
)
table.insert(dap.configurations.python,
    {
        type = "python",
        request = "launch",
        name = "Train NCS",
        program = "F:/DeepAsset/deepasset/deepasset/learn.py",
        console = "integratedTerminal",
        pythonPath = python_path,
        args = {
            "fit", "--config",
            "F:/DeepAsset/deepasset/config/ncs/train.yaml",
        }
    }
)

--dap.set_log_level("TRACE")

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

-- Telescope stuff
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

vim.keymap.set('n', '<leader>f', function() builtin.find_files({ hidden = true }) end, {})


-- AutoSession stuff
require("auto-session").setup {
  suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
}

-- NeoVim LSP stuff
require'lspconfig'.pyright.setup{
    settings = {
        python = {
            pythonPath = vim.g.python3_host_prog,
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic",
                autoImportCompletions = true,
            }
        }
    }
}

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- LSP Inc Rename
require("inc_rename").setup()
vim.keymap.set("n", "<leader>rn", ":IncRename ")
