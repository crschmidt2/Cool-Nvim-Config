local heirline_colors = require('plugins.heirline.colors')

return {
  provider = function()
    local osName = vim.loop.os_uname().sysname
    if osName == 'Windows_NT'
    then
      return ''
    elseif osName == 'Linux'
    then
      return ''
    else
      return ''
    end
  end,
  update = 'InsertEnter',
  hl = function()
    if heirline_colors.is_custom_highlighted then
      return {
        fg = 'normal_fg1',
        bg = 'normal_bg1'
      }
    end
    return nil
  end
}
