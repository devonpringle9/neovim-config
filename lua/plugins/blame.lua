return {
  {
    "FabijanZulj/blame.nvim",
    lazy = false,
    keys = {
        { "<leader>gb", "<cmd>BlameToggle<cr>", { desc = "Blame toggle git blame" } },
    },
    config = function()
      require('blame').setup {}
    end,
  },
}
