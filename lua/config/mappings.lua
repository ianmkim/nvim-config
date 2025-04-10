local map = vim.keymap.set
map("n", "<leader>q", ":q!<CR>", {})
-- Fast saving with <leader> and s
map("n", "<leader>w", ":w<CR>", {})

-- NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree sidebar" })    -- open/close
map("n", "<leader>er", ":NvimTreeRefresh<CR>", { desc = "Refresh NvimTree" })         -- refresh

-- fzf
map("n", "<leader>ff", ":FzfLua files<CR>", { desc = "Fzf files" })
map("n", "<leader>o", ":FzfLua buffers<CR>", { desc = "Fzf buffers" })
map("n", "<leader>ft", ":FzfLua tabs<CR>", { desc = "Fzf tabs" })
map("n", "<leader>fl", ":FzfLua lines<CR>", { desc = "Fzf lines" })
map("n", "<leader>ft", ":FzfLua live_grep<CR>", { desc = "Fzf lines" })

-- faster movements
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- faster splits
map("n", "<leader>ss", ":split<CR>")
map("n", "<leader>sl", ":vsplit<CR>")

-- gitlab reviews and whatnot
map("n", "<leader>mr", function() require("gitlab").choose_merge_request() end, { desc = "Choose Merge Request" })
map("n", "<leader>rmr", function() require("gitlab").review() end, { desc = "Review Merge Request" })
map("n", "<leader>glc", function() require("gitlab").create_comment() end, { desc = "Review Merge Request" })

