return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    'FelipeLema/cmp-async-path',
    dependencies = { 'hrsh7th/nvim-cmp' }, -- Explicitly state dependency if lazy.nvim doesn't pick it up
    -- Optional: Add 'event' or 'ft' to lazy-load if not already handled by nvim-cmp
    -- event = "BufReadPost",
    -- ft = { "lua", "python", "gitcommit" }, -- Example filetypes where path completion is useful
  },
  {
    "github/copilot.vim",
    event = "VimEnter",
    init = function ()
      vim.g.copilot_no_tab_map = false
      vim.g.copilot_workspace_folders = { vim.fn.getcwd() }
    end,
    keys = {
      {"<S-a>", "copilot#Accept()", { expr = true, silent = true, mode = "i"}},
      {"<C-a>", "copilot#Accept()", { expr = true, silent = true, mode = "c"}},
      {"<C-Right>", "copilot#Next()", { expr = true, silent = true, mode = "i"}},
      {"<C-Left>", "copilot#Previous()", { expr = true, silent = true, mode = "i"}},
      {"<C-Right>", "copilot#Next()", { expr = true, silent = true, mode = "c"}},
      {"<C-Left>", "copilot#Previous()", { expr = true, silent = true, mode = "c"}},
      {"<C-Down>", "copilot#Dismiss()", { expr = true, silent = true, mode = "i"}},
      {"<C-Down>", "copilot#Dismiss()", { expr = true, silent = true, mode = "c"}},
      {"<C-Down>", "copilot#Dismiss()", { expr = true, silent = true, mode = "n"}},
      {"<C-Down>", "copilot#Dismiss()", { expr = true, silent = true, mode = "v"}},

    },

  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- If you want to use Telescope integration (highly recommended), also add:
      -- "nvim-telescope/telescope.nvim",
    },
    keys = {
      -- You can set a keybinding here. For example, <leader>lg to open LazyGit.
      { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
    },
    config = function()
      -- Optional: If you included telescope.nvim as a dependency and want integration
      -- require("telescope").load_extension("lazygit")
    end,
  }

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
