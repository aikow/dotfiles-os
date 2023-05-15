local colorscheme = require("aiko.theme.colorscheme").Scheme:new({
  name = "rosepine",
  background = "dark",
})

colorscheme.theme = {
  base00 = "#191724",
  base01 = "#1f1d2e",
  base02 = "#26233a",
  base03 = "#6e6a86",
  base04 = "#908caa",
  base05 = "#e0def4",
  base06 = "#e0def4",
  base07 = "#524f67",
  base08 = "#eb6f92",
  base09 = "#f6c177",
  base0A = "#ebbcba",
  base0B = "#31748f",
  base0C = "#9ccfd8",
  base0D = "#c4a7e7",
  base0E = "#f6c177",
  base0F = "#524f67",
}

colorscheme.colors = {
  bg_1 = "#1f1d2a",
  bg_2 = "#262431",
  bg_3 = "#2d2b38",
  bg_4 = "#353340",
  bg_folder = "#6aadc8",
  bg_light = "#2d2b38",
  bg_pmenu = "#c4a7e7",
  bg_statusline = "#201e2b",
  black = "#191724",
  blue = "#8bbec7",
  cyan = "#a3d6df",
  dark_black = "#13111e",
  dark_purple = "#bb9ede",
  green = "#abe9b3",
  grey = "#3f3d4a",
  light_green = "#b5f3bd",
  light_grey_1 = "#474552",
  light_grey_2 = "#514f5c",
  light_grey_3 = "#5d5b68",
  light_pink = "#f5799c",
  line = "#2e2c39",
  nord_blue = "#86b9c2",
  orange = "#f6c177",
  pink = "#ff83a6",
  purple = "#c4a7e7",
  red = "#eb6f92",
  sun = "#fec97f",
  teal = "#6aadc8",
  white = "#e0def4",
  yellow = "#f6c177",
}

colorscheme.polish = {}

require("aiko.theme").paint(colorscheme)
