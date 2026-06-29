return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
        { "<leader>fg", function() require('telescope.builtin').live_grep() end, { desc = 'Telescope live grep' } },
        { "<leader>fw", function() require('telescope.builtin').grep_string() end, { desc = 'Telescope search string under cursor' } },
        { "<leader>fb", function() require('telescope.builtin').buffers() end, { desc = 'Telescope list buffers' } },
        { "<leader>fman", function() require('telescope.builtin').man_pages() end, { desc = 'Telescope list buffers' } },

        { '<leader>cs', function() require('telescope.builtin').colorscheme({ enable_preview = true }) end, { desc = 'Telescope colorschemes with preview'} },
    },
    config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = {
                        preview_width = 0.5,
                        preview_cutoff = 0, -- Ensures preview shows even in narrower terminals
                    },
                    vertical = {
                        width = 0.9,
                    },
                },
               -- Exclude large or binary files from previewing to prevent freezing
               file_previewer = require("telescope.previewers").vim_buffer_cat.new,
               grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            }
        })
    end,
}
