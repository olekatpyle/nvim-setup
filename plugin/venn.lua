local has_notfiy, notify = pcall(require, "notify")

function _G.Toggle_venn()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == "nil" then
    vim.b.venn_enabled = true
    vim.cmd([[setlocal ve=all]])
    -- draw a line on HJKL keystokes
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "J",
      "<C-v>j:VBox<CR>",
      { noremap = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "K",
      "<C-v>k:VBox<CR>",
      { noremap = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "L",
      "<C-v>l:VBox<CR>",
      { noremap = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "H",
      "<C-v>h:VBox<CR>",
      { noremap = true }
    )
    -- draw a box by pressing "f" with visual selection
    vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
    if has_notfiy then
      notify("Venn enabled!", "info")
    end
  else
    vim.cmd([[setlocal ve=]])
    vim.cmd([[mapclear <buffer>]])
    vim.b.venn_enabled = nil
    if has_notfiy then
      notify("Venn disabled!", "info")
    end
  end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap(
  "n",
  "<leader>v",
  ":lua Toggle_venn()<CR>",
  { noremap = true }
)
