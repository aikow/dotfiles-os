local colorscheme = require("aiko.theme.colorscheme").Scheme:new({
  name = "solarized-dark",
  background = "dark",
})

colorscheme.theme = {
  base00 = "#002b36",
  base01 = "#06313c",
  base02 = "#0a3540",
  base03 = "#133e49",
  base04 = "#1b4651",
  base05 = "#93a1a1",
  base06 = "#eee8d5",
  base07 = "#fdf6e3",
  base08 = "#dc322f",
  base09 = "#cb4b16",
  base0A = "#b58900",
  base0B = "#859900",
  base0C = "#2aa198",
  base0D = "#268bd2",
  base0E = "#6c71c4",
  base0F = "#d33682",
}

colorscheme.colors = {
  bg_1 = "#06313c",
  bg_2 = "#0a3540",
  bg_3 = "#133e49",
  bg_4 = "#1b4651",
  bg_folder = "#268bd2",
  bg_light = "#113c47",
  bg_pmenu = "#268bd2",
  bg_statusline = "#042f3a",
  black = "#002b36",
  blue = "#268bd2",
  cyan = "#2aa198",
  dark_black = "#002530",
  dark_purple = "#5d62b5",
  green = "#859900",
  grey = "#28535e",
  light_green = "#b2c62d",
  light_grey_1 = "#325d68",
  light_grey_2 = "#3c6772",
  light_grey_3 = "#446f7a",
  light_pink = "#eb413e",
  line = "#0f3a45",
  nord_blue = "#197ec5",
  orange = "#cb4b16",
  pink = "#d33682",
  purple = "#6c71c4",
  red = "#dc322f",
  sun = "#c4980f",
  teal = "#519aba",
  white = "#abb2bf",
  yellow = "#b58900",
}

colorscheme.polish = {}

require("aiko.theme").paint(colorscheme)
