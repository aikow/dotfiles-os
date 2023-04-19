local Colorscheme = require("aiko.theme.colorscheme").Colorscheme

local colorscheme = Colorscheme.new({
  name = "decay",
  background = "dark",
})

colorscheme.theme = {
  base00 = "#171B20",
  base01 = "#21262e",
  base02 = "#242931",
  base03 = "#485263",
  base04 = "#485263",
  base05 = "#b6beca",
  base06 = "#dee1e6",
  base07 = "#dee1e6",
  base08 = "#e05f65",
  base09 = "#e9a180",
  base0A = "#f1cf8a",
  base0B = "#78DBA9",
  base0C = "#9cd1ff",
  base0D = "#74bee9",
  base0E = "#c68aee",
  base0F = "#e05f65",
}

colorscheme.colors = {
  white = "#dee1e6",
  dark_black = "#111519",
  black = "#171B20",
  bg_1 = "#1e2227",
  bg_2 = "#262a2f",
  bg_3 = "#2f3338",
  bg_4 = "#373b40",
  grey = "#41454a",
  light_grey_1 = "#494d52",
  light_grey_2 = "#505459",
  light_grey_3 = "#5a5e63",
  red = "#e05f65",
  light_pink = "#ea696f",
  pink = "#c68aee",
  line = "#282d35",
  green = "#78DBA9",
  light_green = "#87eab8",
  blue = "#70a5eb",
  nord_blue = "#74bee9",
  yellow = "#f1cf8a",
  sun = "#e7c580",
  purple = "#c68aee",
  dark_purple = "#b77bdf",
  teal = "#7ddac5",
  orange = "#e9a180",
  cyan = "#74bee9",
  bg_statusline = "#1c2026",
  bg_light = "#2b3038",
  bg_pmenu = "#7ddac5",
  bg_folder = "#78DBA9",
}

require("aiko.theme").paint(colorscheme)
