-- Trong neovim, kí tự \ mặc định được gọi là <leader>
-- tuy nhiên, vì nó quá xa để nhấn, nên ae dev hay đổi kí tự này
-- sang kí tự <space> để gần hơn
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Để fix lỗi:  You need to set `vim.g.maplocalleader` ** lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Import plugins folder and config it
require("lazy").setup({ { import = "thohnb/plugins" }})
