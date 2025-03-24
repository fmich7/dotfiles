return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  ft = { "go" },
  config = function()
    vim.g["test#strategy"] = "neovim"
  end,
}
