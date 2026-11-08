-- Show hidden (dotfiles) and gitignored files (e.g. .env) in the explorer and pickers
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = { hidden = true, ignored = true },
          files = { hidden = true, ignored = true },
          grep = { hidden = true, ignored = true },
        },
      },
    },
  },
}
