require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set

-- MISC KEYBINDS
map("n", ";", ":", { desc = "CMD enter command mode" })
map("v", ">", ">gv") -- RESELECT AFTER INDENTING
map("v", "<", "<gv") -- RESELECT AFTER INDENTING

-- CLOSE CURRENT BUFFER
map("n", "<leader>xx", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "close buffer" })

-- CLOSE OTHER BUFFERS
map("n", "<leader>xo", ":%bd|e#<CR>", { desc = "close other buffers" })

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

-- Todo telescope
map("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "telescope todo's" })

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

-- Git
local gitsigns = require("gitsigns")

-- Navigation
map("n", "]c", function()
	gitsigns.nav_hunk("next")
end, { desc = "Next Git hunk" })
map("n", "[c", function()
	gitsigns.nav_hunk("prev")
end, { desc = "Previous Git hunk" })

-- Actions
map("n", "<leader>hs", function()
	gitsigns.stage_hunk()
end, { desc = "Stage hunk" })
map("n", "<leader>hr", function()
	gitsigns.reset_hunk()
end, { desc = "Reset hunk" })
map("v", "<leader>hs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage selected hunk" })
map("v", "<leader>hr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset selected hunk" })

map("n", "<leader>hS", function()
	gitsigns.stage_buffer()
end, { desc = "Stage buffer" })

map("n", "<leader>hR", function()
	gitsigns.reset_buffer()
end, { desc = "Reset buffer" })

map("n", "<leader>hp", function()
	gitsigns.preview_hunk()
end, { desc = "Preview hunk" })

-- Blame & Diffs
map("n", "<leader>hb", function()
	gitsigns.blame_line({ full = true })
end, { desc = "Git blame" })

map("n", "<leader>hd", function()
	gitsigns.diffthis()
end, { desc = "Git diff" })

map("n", "<leader>hD", function()
	gitsigns.diffthis("~")
end, { desc = "Git diff (against previous commit)" })

-- Quickfix
map("n", "<leader>hQ", function()
	gitsigns.setqflist("all")
end, { desc = "Git hunks in QuickFix" })

map("n", "<leader>hq", function()
	gitsigns.setqflist()
end, { desc = "Git hunks in QuickFix (current file)" })

-- Toggles
map("n", "<leader>tb", function()
	gitsigns.toggle_current_line_blame()
end, { desc = "Toggle line blame" })
