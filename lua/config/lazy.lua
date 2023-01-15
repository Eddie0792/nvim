local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- import plugins
    { import = "plugins" },
    -- see LazyVim/LazyVim, for examples
  },
  lockfile = vim.fn.stdpath("config") .. "/lua/config/lazy-lock.json",
  defaults = {
    -- lazy = true, -- all plugins lazy-loaded by default
    version = "*", -- Try latest stable ver (if plugin supports semver)
  },
  checker = {
    enabled = false,
    notify = true,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarpPugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
