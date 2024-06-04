return {
  -- Neosolarized colour scheme
  {
    "svrana/neosolarized.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "tjdevries/colorbuddy.nvim" },
    enabled = true,
    opts = {
      comment_italics = true,
      background_set = true,
    },
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme neosolarized]])
    end,
  },
}
