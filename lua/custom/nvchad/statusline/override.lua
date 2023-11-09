local M = {}

-- nvchad loads the statusline by `nvchad.statusline." .. config.ui.statusline.theme`
-- set chadrc statusline theme to "override", the name of this file and just call a hook in lualine instead
M.run = function()
  return require('lualine').statusline()
end

return M
