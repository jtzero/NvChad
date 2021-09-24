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

local enable_providers = {
  "python3_provider",
  "node_provider",
  "ruby_provider",
  -- and so on
}
for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end

M.mappings = {
  general = {
    n = {
      ["<C-c>"] = { "", "" }, -- disables default
    }
  },
  nvimtree = {
    n = {
      ["<C-n>"] = { "", ""},
      ["<C-o>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" }
    }
  }

}
M.plugins = {
  ["windwp/nvim-autopairs"] = false, -- auto createes closing paren bracket quote etc
  ["lukas-reineke/indent-blankline.nvim"] = false, -- highlights blocks and provides vertical lines on indent
  ['ntpeters/vim-better-whitespace'] = {},
  ["nvim-treesitter/nvim-treesitter"] = {
      auto_install = true,
      highlight = {
        enable = true,
        use_languagetree = true,
        disable = { "python" },
      },
    },

  ["folke/which-key.nvim"] = { disable = false },
  ['numirias/semshi'] = { ft = 'python', config = 'vim.cmd [[UpdateRemotePlugins]]'},
  ["NvChad/nvim-colorizer.lua"] = {
      filetypes = {
        '*',
        '!python',
      },
    },
}

return M
