local Colorscheme = require("aiko.theme.colorscheme").Colorscheme

local colorscheme = Colorscheme.new({
  name = "dark-horizon",
  background = "dark",
})

colorscheme.colors = {
  white = "#FFFFFF",
  dark_black = "#080808",
  black = "#0e0e0e", --  nvim bg
  bg_1 = "#181818",
  bg_2 = "#1c1c1c",
  bg_3 = "#212121",
  bg_4 = "#292929",
  grey = "#363636",
  light_grey_1 = "#404040",
  light_grey_2 = "#4a4a4a",
  light_grey_3 = "#525252",
  red = "#dc322f",
  light_pink = "#a72e5b",
  pink = "#ff75a0",
  line = "#1d1d1d", -- for lines like vertsplit
  green = "#AAD84C",
  light_green = "#b9e75b",
  nord_blue = "#18a3af",
  blue = "#25B0BC",
  yellow = "#fdb830",
  sun = "#ffc038",
  purple = "#da70d6",
  dark_purple = "#c65cc2",
  teal = "#749689",
  orange = "#FFA500",
  cyan = "#6BE4E6",
  bg_statusline = "#181818",
  bg_light = "#292929",
  bg_pmenu = "#15bf84",
  bg_folder = "#07929e",
}

colorscheme.theme = {
  base00 = "#0e0e0e",
  base01 = "#181818",
  base02 = "#292929",
  base03 = "#363636",
  base04 = "#3f4248",
  base05 = "#c9c7be",
  base06 = "#E6E1CF",
  base07 = "#D9D7CE",
  base08 = "#D9D7CE", -- Confirmed: Variables Confirmed
  base09 = "#eaa273", -- Confirmed: Integers, Booleans
  base0A = "#825aff", -- Classes
  base0B = "#E3A587", -- Confirmed: Strings
  base0C = "#F09483", -- Escape characters, Regular expressions
  base0D = "#FFA500", -- Functions, Methods
  base0E = "#2ca9b4", -- Confirmed: Keywords, Storage, Selector, Markup
  base0F = "#d75271", -- Deprecated, Opening/Closing embedded language tags
}

colorscheme.polish = {
  Include = { fg = colorscheme.theme.base0E, bold = true },
  luaTSField = { fg = colorscheme.theme.base0E },
  Repeat = { fg = colorscheme.theme.base0E },
  ["@variable"] = { fg = colorscheme.theme.base08 },
  ["@property"] = { fg = colorscheme.theme.base0E },
  ["@tag.delimiter"] = { fg = colorscheme.theme.base05 },
  ["@function"] = { fg = colorscheme.colors.orange },
  ["@parameter"] = { fg = colorscheme.theme.base0F },
  ["@constructor"] = { fg = colorscheme.theme.base0A },
  ["@tag.attribute"] = { fg = colorscheme.colors.orange },
}

require("aiko.theme").paint(colorscheme)
