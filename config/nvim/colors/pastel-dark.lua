local colorscheme = require("aiko.theme.colorscheme").Scheme:new({
  name = "pastelDark",
  background = "dark",
})

colorscheme.theme = {
  base00 = "#131a21",
  base01 = "#2c333a",
  base02 = "#31383f",
  base03 = "#40474e",
  base04 = "#4f565d",
  base05 = "#ced4df",
  base06 = "#d3d9e4",
  base07 = "#b5bcc9",
  base08 = "#ef8891",
  base09 = "#eda685",
  base0A = "#f5d595",
  base0B = "#9ce5c0",
  base0C = "#abb9e0",
  base0D = "#a3b8ef",
  base0E = "#c2a2e3",
  base0F = "#e88e9b",
}

colorscheme.colors = {
  bg_1 = "#1a2128",
  bg_2 = "#1e252c",
  bg_3 = "#2a3138",
  bg_4 = "#363d44",
  bg_folder = "#99aee5",
  bg_light = "#222930",
  bg_pmenu = "#ef8891",
  bg_statusline = "#181f26",
  black = "#131a21",
  blue = "#99aee5",
  cyan = "#b5c3ea",
  dark_black = "#10171e",
  dark_purple = "#b696d7",
  green = "#9fe8c3",
  grey = "#363d44",
  light_green = "#9ce5c0",
  light_grey_1 = "#4e555c",
  light_grey_2 = "#51585f",
  light_grey_3 = "#545b62",
  light_pink = "#fca2aa",
  line = "#272e35",
  nord_blue = "#9aa8cf",
  orange = "#eda685",
  pink = "#fca2af",
  purple = "#c2a2e3",
  red = "#ef8891",
  sun = "#fbdf9a",
  teal = "#92dbb6",
  white = "#b5bcc9",
  yellow = "#fbdf90",
}

colorscheme.polish = {}

require("aiko.theme").paint(colorscheme)
