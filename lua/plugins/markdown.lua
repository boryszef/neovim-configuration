return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
      -- don't auto start preview
      vim.g.mkdp_auto_start = 0
      -- open in browser by default (set to 0 to use internal)
      -- vim.g.mkdp_open_to_the_world = 0
      -- map <leader>m to toggle preview
      vim.keymap.set("n", "<leader>m", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
    end,
  },
}
