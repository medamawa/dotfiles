return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "master",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({
      highlight = { enable = true }, -- enable syntax highlighting
      indent = { enable = true }, -- enable indentation

      -- ensure these language parsers are installed
      ensure_installed = {
        "c", "cpp", "asm",
        "python",
        "java", "javadoc",
        "javascript", "typescript",
        "html", "css", "tsx",
        "json", "yaml",
        "query",
        "dockerfile", "gitignore", "nginx",
        "markdown", "markdown_inline",
        "make", "cmake",
        "bash", "lua",
        "vim", "vimdoc",
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })

    -- use bash parser for zsh files
    vim.treesitter.language.register("bash", "zsh")
  end,
}
