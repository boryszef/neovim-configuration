return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    config = function()
      require("render-markdown").setup({
        file_types = { "markdown" },
        render = {
          margin = 2,
          padding = { top = 1, bottom = 1 },
        },
        heading = {
          sign = true,
          icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
        },
        code = {
          sign = true,
          style = "full",
          left_pad = 1,
          right_pad = 1,
        },
        bullet = {
          highlight = "@markup.list.markdown",
          icons = { "●", "○", "◆", "◇" },
        },
      })
      -- map <leader>m to toggle render-markdown
      vim.keymap.set("n", "<leader>m", ":RenderMarkdown toggle<CR>", { noremap = true, silent = true })
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
