require("plugins");
require("remap");

vim.cmd("colorscheme nightfox");

vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.smartindent = true;
vim.opt.wrap = false;
vim.opt.expandtab = true;

vim.opt.swapfile = false;
vim.opt.backup = false;
vim.opt.undodir = os.getenv("HOME") .. "/.vim//undodir";
vim.opt.undofile = true;

vim.opt.number = true;
vim.opt.relativenumber = true;
vim.opt.signcolumn = "yes";
vim.opt.cursorline = true;
vim.opt.visualbell = true;

vim.opt.hlsearch = true;
vim.opt.incsearch = true;
vim.opt.ignorecase = true;

vim.opt.termguicolors = true;

vim.opt.mouse = "a";
vim.opt.completeopt = "menuone,noselect";
