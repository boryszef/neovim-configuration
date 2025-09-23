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

vim.keymap.set("n", "<leader>?", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, {})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = "rounded", width = 70, height = 15 }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { border = "rounded" }
)


local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- Completion Plugin Setup
--local cmp = require'cmp'
--cmp.setup({
  -- Enable LSP snippets
--  snippet = {
--    expand = function(args)
--        vim.fn["vsnip#anonymous"](args.body)
--    end,
--  },
--  mapping = {
--    ['<C-p>'] = cmp.mapping.select_prev_item(),
--    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
--    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--    ['<Tab>'] = cmp.mapping.select_next_item(),
--    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-f>'] = cmp.mapping.scroll_docs(4),
--    ['<C-Space>'] = cmp.mapping.complete(),
--    ['<C-e>'] = cmp.mapping.close(),
--    ['<CR>'] = cmp.mapping.confirm({
--      behavior = cmp.ConfirmBehavior.Insert,
--      select = true,
--    })
--  },
--})
