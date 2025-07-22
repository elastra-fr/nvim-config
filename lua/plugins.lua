-- bootstrap de Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    {"catppuccin/nvim", name= "catppuccin", priority = 1000},
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
  {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"}
}
local opts = {}

-- plugins avec Lazy
require("lazy").setup(plugins, opts)
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', function() builtin.find_files() end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local config = require("nvim-treesitter.configs")
config.setup(
{
ensure_installed = {"lua", "javascript"},
highlight = {enable = true},
indent = {enable = true},

}

)

require("catppuccin").setup()

