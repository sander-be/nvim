local function getHomeDir()
    local ENV_HOME = os.getenv("HOME");

    if type(ENV_HOME) == "string" then
        return ENV_HOME
    end

    local ENV_HOMEDRIVE = os.getenv("HOMEDRIVE");
    local ENV_HOMEPATH = os.getenv("HOMEPATH");

    return nil
end

vim.g.netrw_banner = 0

vim.opt.encoding = "UTF-8"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4 
vim.opt.softtabstop = 4 
vim.opt.shiftwidth = 4 
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "0"
vim.opt.textwidth = 88 
vim.opt.wrap = false

vim.opt.scrolloff = 4 
vim.opt.sidescrolloff = 4

vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true

-- vim.opt.guicursor = ""

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.hl.on_yank()
    end,
})
vim.opt.clipboard:append("unnamedplus")

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = getHomeDir() .. "/.vim/undodir"
vim.opt.undofile = true

-- for tinymist preview
vim.opt.backupcopy = "yes"
