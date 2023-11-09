
-- this file is to override lua/core/default_config.lua
local M = {}

M.ui = {
  italic_comments = false,

  -- theme to be used, to see all available themes, open the theme switcher by <leader> + th
  -- telescope themes current theme is saved here
  theme = "chadracula",
  -- not sure this is needed anymore
  -- theme toggler, toggle between two themes, see theme_toggleer mappings
  theme_toggler = {
     enabled = false,
     fav_themes = {
        "chadracula",
        "gruvchad"
     },
  },

  -- Enable this only if your terminal has the colorscheme set which nvchad uses
  -- For Ex : if you have chadracula set in nvchad , set chadracula's bg color on your terminal
  transparency = false,
  --statusline = {
  --  theme = "override",
  --},
  nvdash = {
    load_on_startup = true,
  }
}

local custom_package_path = vim.fs.dirname(debug.getinfo(1).source):sub(2)

if not string.find(package.path, custom_package_path) then
  package.path = package.path .. ";" .. custom_package_path .. '/?.lua'
end

M.mappings = {
  general = {
    n = {
      ["<C-c>"] = { "", "disabled" }, -- disables default
    }
  },
  nvimtree = {
    n = {
      ["<C-n>"] = { "", "disabled"},
      ["<C-;>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" }
    }
  }
}

M.plugins = "custom.plugins"

M.lazy_nvim = {
  performance = {
    rtp = {
      disabled_plugins = { "2html_plugin", "tohtml", "getscript", "getscriptPlugin", "gzip", "logipat", "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers", "matchit", "tar", "tarPlugin", "rrhelper", "spellfile_plugin", "vimball", "vimballPlugin", "zip", "zipPlugin", "tutor", "syntax", "synmenu", "optwin", "compiler", "bugreport", "ftplugin" }
    }
  }
}

return M
