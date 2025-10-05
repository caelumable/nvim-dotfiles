-- 1. ׼��lazy.nvimģ�飨�����Լ�⣩
-- stdpath("data")
-- macOS/Linux: ~/.local/share/nvim
-- Windows: ~/AppData/Local/nvim-data

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
--
-- 2. �� lazypath ����Ϊ����ʱ·��
-- rtp��runtime path��
-- nvim����·��������ʱ�򣬳����е�·���������prepend��·���в���
-- �������� require("lazy") ���Ҳ�����
vim.opt.rtp:prepend(lazypath)

-- 3. ����lazy.nvimģ��
--require("lazy").setup("plugins")

require("lazy").setup({
  spec = {
    {import = 'plugins'},
    {import = 'plugins.lsp'},
    {import = 'plugins.Dap'},
  },
  defaults = {lazy = true,version=nil},
  install = {missing = true,colorscheme = {'tokyonight-moon'}},
  ui = {border = 'rounded'}
})

