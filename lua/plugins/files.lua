return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        hijack_netrw = true,
        update_cwd = true,         -- update the tree root to match cwd
        sync_root_with_cwd = true, -- keep tree in sync with working dir
        respect_buf_cwd = true,    -- open tree in buffer's cwd
      })
    end
  },
}
