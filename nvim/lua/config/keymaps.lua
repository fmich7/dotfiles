-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap

map.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
map.del("n", "<leader>fE", {})
map.set("n", "<C-n>", "<cmd>Neotree filesystem toggle left<CR>", { desc = "open Neotree" })
map.del("n", "<leader>fe", {})
