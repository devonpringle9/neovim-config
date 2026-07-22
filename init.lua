-- Enable line numbers and relative numbers to jump to other lines on the screen using relative counts
vim.opt.number = true

-- We also want the ability to undo changes after exiting and reopening the file
vim.opt.undofile = true


-- Improved window-splitting behavior - while the default is acceptable, most people find this more natural as it mimics reading a document from top to bottom and left to right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- The default leader key is \, but using the Space bar is way more convenient
vim.g.mapleader = " "

-- This is a bit controversial, but 4 spaces is the sweet spot for tab size, and we configure the tab key to insert spaces instead
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- set to 0 to default to tabstop value

-- todo: Additionally, you can use the vim-sleuth plugin below to heuristically determine those values based on your project

-- Hide the default netrw banner at the top
vim.g.netrw_banner = 0
-- Set default view to tree style (3)
vim.g.netrw_liststyle = 3
-- Make netrw open in a left vertical split taking 25% of the screen
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25
-- Keep the current directory and the browsing directory synced. This helps you avoid the move files error.
vim.g.netrw_keepdir = 0
-- Change the copy command. Mostly to enable recursive copy of directories.
vim.g.netrw_localcopydircmd = 'cp -r'
-- vim.keymap.set("n", "<leader>dd", ":Lexplore %:p:h<CR>")
-- vim.keymap.set("n", "<leader>da", ":Lexplore<CR>")

-- shortcut for <ESC> to escape insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- default colourscheme saved as 'vscode' in 'plugins/colourscheme-vscode.lua'

-- lazy.nvim is by far the best plugin manager for Neovim. It's fast, easy to use, feature-rich, and unmatched in its ability to lazy-load plugins for significantly better performance (hence the name)

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("config.lazy")

