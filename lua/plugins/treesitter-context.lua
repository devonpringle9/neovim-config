return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      enable = true,
      max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 1000, -- Maximum number of lines to show for a single context
      trim_scope = "inner", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'topline',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    },
    keys = {
      { "<leader>ut", function() local tsc = require("treesitter-context") tsc.toggle() end, desc = "Toggle Treesitter Context", },
    },
  },
}

