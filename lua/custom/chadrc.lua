-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- this is to override lua/core/default_config.lua
local M = {}

-- non plugin ui configs, available without any plugins
M.ui = {
   italic_comments = false,

   -- theme to be used, to see all available themes, open the theme switcher by <leader> + th
   --theme = "onedark",
   theme = "chadracula",
   -- theme toggler, toggle between two themes, see theme_toggleer mappings
   theme_toggler = {
      enabled = false,
      fav_themes = {
         "onedark",
         "gruvchad",
      },
   },

   -- Enable this only if your terminal has the colorscheme set which nvchad uses
   -- For Ex : if you have onedark set in nvchad , set onedark's bg color on your terminal
   transparency = false,
   statusline = {
      separator_style = "default", -- default/round/block/arrow
      config = "",
      override = {},
   },
}

M.options = {
    user = function()
      local enable_providers = {
        "python3_provider",
        "node_provider",
        "ruby_provider",
        -- and so on
      }
      for _, plugin in pairs(enable_providers) do
        vim.g["loaded_" .. plugin] = nil
      --  vim.cmd("runtime " .. plugin)
      end
    end,
}

M.plugins = {
  options = {
    --lspconfig = {
    --  setup_lspconfig = "",
    --}
  },
  remove = {
      "windwp/nvim-autopairs", -- auto createes closing paren bracket quote etc
      "lukas-reineke/indent-blankline.nvim", -- highlights blocks and provides vertical lines on indent
  },
  -- enable and disable plugins (false for disable)
  status = {
    bufferline = true, -- buffer shown as tabs
    cheatsheet = true, -- fuzzy search your commands/keymappings
    gitsigns = true, -- gitsigns in statusline
    lspsignature = true, -- lsp enhancements
    neoformat = true, -- universal formatter
    neoscroll = true, -- smooth scroll
    telescope_media = false, -- see media files in telescope picker
    truezen = false, -- no distraction mode for nvim
    vim_fugitive = false, -- git in nvim
  },
  install = {
      ['ntpeters/vim-better-whitespace'] = {},
      ["folke/which-key.nvim"] = { disable = false },
  },
  user = {
    ["NvChad/extensions"] = {
        commit = "785eaa25a9bbdf47a6808dc5b6da1747abe10b2b"
      },
  },
  override = {
    ["nvim-treesitter/nvim-treesitter"] = {
      auto_install = true,
      highlight = {
        enable = true,
        use_languagetree = true,
        disable = { "python" },
      },
    },
    ["NvChad/nvim-colorizer.lua"] = {
      filetypes = {
        '*',
        '!python',
      },
    },
  }
}
