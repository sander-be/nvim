vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader>q", "<Cmd>q<CR>", { desc = "Close file" })
vim.keymap.set("n", "<leader>e", "<Cmd>Ex<CR>", { desc = "Open explorer" })


vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })


vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })


vim.keymap.set("n", "<C-k>", "<Cmd>m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<C-j>", "<Cmd>m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("v", "<C-k>", "<Cmd>m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<C-j>", "<Cmd>m '>+1<CR>gv=gv", { desc = "Move selection down" })


vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down, centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up, centered" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result, centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result, centered" })


vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Go to below window" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Go to above window" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Go to right window" })

vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]], { desc = "Go to left window" })
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]], { desc = "Go to below window" })
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]], { desc = "Go to above window" })
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]], { desc = "Go to right window" })
vim.keymap.set("t", "<A-n>", [[<C-\><C-n>]], { desc = "Leave terminal mode" })


vim.keymap.set("n", "<leader>s", "<Cmd>vsplit<CR><C-w>w", { desc = "Split current file vertically" })

local function toggle_split_orientation()
	if vim.fn.winnr("$") < 2 then
		return
	end

	vim.cmd("wincmd t")
	local before = vim.fn.winrestcmd()

	vim.cmd("wincmd K")

	-- "wincmd K" is a no-op on an already-horizontal layout, so that means we want vertical
	if vim.fn.winrestcmd() == before then
		vim.cmd("wincmd t")
		vim.cmd("wincmd H")
	end
end

vim.keymap.set("n", "<leader>d", toggle_split_orientation, { desc = "Toggle split orientation" })


vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word cursor is on globally" })


-- vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart config :restart)" })


local function open_terminal_rightmost()
	local width = math.floor(vim.o.columns / 2)
	vim.cmd("botright " .. width .. "vnew")
	vim.cmd.terminal()
	vim.cmd.startinsert()
end

vim.keymap.set("n", "<leader>t", open_terminal_rightmost, { desc = "Open a terminal on the right" })


-- native undotree
vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })
