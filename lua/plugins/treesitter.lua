return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- The new API configures treesitter directly via opts, avoiding the deleted module
      require("nvim-treesitter").setup({
        -- Add the programming languages you want parsing for here:
        ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "javascript", "typescript", "cpp" },
        highlight = { enable = true }, -- Enables structural highlighting
        indent = { enable = true },
      })
    end,
  },
}

