require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set

-- MISC KEYBINDS
map("n", ";", ":", { desc = "CMD enter command mode" })
map("v", ">", ">gv") -- RESELECT AFTER INDENTING
map("v", "<", "<gv") -- RESELECT AFTER INDENTING
-- Highlight text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ 🦠 PLUGINS KEYMAPS 🦠 ]]

-- NeoTree
map({ "n", "i" }, "<C-n>", ":Neotree filesystem toggle<CR>", { desc = "NeoTree toggle panel" })

-- Git
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Git preview hunks" })
map("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Git show inline blame" })

-- Todo telescope
map("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Search through all project todos with Telescope" })

-- DAP
map("n", "<Leader>dt", require("dap").toggle_breakpoint, { desc = "DAP Toggle breakpoint" })
map("n", "<Leader>dc", require("dap").continue, { desc = "DAP Continue" })
map("n", "<Leader>dg", require("dap-go").debug_test, { desc = "DAP Go test" })

-- Vim test
map("n", "<leader>tt", ":TestNearest<CR>", { desc = "TEST nearest test" })
map("n", "<leader>tT", ":TestFile<CR>", { desc = "TEST all in file" })
map("n", "<leader>ta", ":TestSuite<CR>", { desc = "TEST run full test suite" })
map("n", "<leader>tl", ":TestLast<CR>", { desc = "TEST last test" })
map("n", "<leader>tg", ":TestVisit<CR>", { desc = "TEST open last test file" })

-- Nvim-tmux-navigator
map("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
map("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
map("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", {})
map("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", {})

-- CODE RUNNER
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		vim.keymap.set(
			"n",
			"<F5>",
			":w<CR>:!g++ -std=c++17 -Wall -Wextra % -o %:r && %:r<CR>",
			{ buffer = true, noremap = true, silent = true }
		)
	end,
})
