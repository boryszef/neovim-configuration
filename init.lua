-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable 24-bit colour
vim.opt.termguicolors = true

require("config.lazy")

-- Setup ruff lsp short-cuts
vim.lsp.config('ruff', {

  on_attach = function(client, bufnr)

    -- format code: "<Space>f"
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = bufnr })

    -- suggest code actions: "<Space>a"
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = bufnr })

    -- client.server_capabilities.hoverProvider = false
  end,
})

--vim.lsp.config('pyright', {
--  on_attach = function(client, _)
--    client.server_capabilities.hoverProvider = true
--  end
--})

-- Auto-open NvimTree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if directory then
      -- change to the directory
      vim.cmd.cd(data.file)
      -- open the tree
      require("nvim-tree.api").tree.open()
    else
      -- if file, open tree but don’t focus it
      require("nvim-tree.api").tree.toggle({ focus = false })
    end
  end,
})


-- Tabline: Next buffer
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

-- Tabline: Previous buffer
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.fn.sign_define("DiagnosticSignError", { text = "❌", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "⚠️", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { text = "💡", texthl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "ℹ️", texthl = "DiagnosticSignInfo" })

vim.keymap.set("n", "<leader>?", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, {})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { border = "rounded" }
)

-- Use darker background for floats (compared to Dracula)
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1c24" })

-- Remap :q, so that it closes the buffer, making tabs disappear
vim.api.nvim_create_user_command("Q", function()
  require("mini.bufremove").delete(0, false)
end, {})

-- Map Esc in terminal mode to go back to normal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

-- Shorthand :b to open a terminal running bash
vim.api.nvim_create_user_command("B", function()
  vim.cmd("edit term://bash")
end, {})

-- Run IPython shell
vim.api.nvim_create_user_command("S", function()
  vim.cmd("edit term://ipython")
end, {})

-- Global / window options for folding
vim.opt.foldmethod = "indent"
vim.opt.foldenable = true
vim.opt.foldlevel = 0
vim.opt.foldminlines = 2

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.tabstop = 4        -- number of spaces a <Tab> counts for
    vim.bo.shiftwidth = 4     -- size of autoindent
    vim.bo.expandtab = true   -- use spaces instead of tabs
    vim.bo.softtabstop = 4    -- spaces inserted when pressing <Tab>
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "css", "html", "javascript", "typescript", "json", "yaml" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
    vim.bo.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "csv",
  callback = function()
    require("csvview").enable()
  end,
})
