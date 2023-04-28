local colorscheme = require("aiko.theme.colorscheme").Scheme:new({
  name = "chadtain",
  background = "dark",
})

colorscheme.theme = {
  base00 = "#1a2026",
  base01 = "#242a30",
  base02 = "#292f35",
  base03 = "#2e343a",
  base04 = "#42484e",
  base05 = "#bebebe",
  base06 = "#bbbbbb",
  base07 = "#b0b0b0",
  base08 = "#ac8a8c",
  base09 = "#c9938a",
  base0A = "#aca98a",
  base0B = "#8aac8b",
  base0C = "#8aabac",
  base0D = "#7797b7",
  base0E = "#948fb1",
  base0F = "#ac8a8c",
}

colorscheme.colors = {
  white = "#b0b0b0",
  dark_black = "#151b21",
  bg = "#1a2026",
  bg_1 = "#20262c",
  bg_2 = "#242a30",
  bg_3 = "#292f35",
  bg_4 = "#2e343a",
  grey = "#42484e",
  light_grey_1 = "#474d53",
  light_grey_2 = "#50565c",
  light_grey_3 = "#565c62",
  red = "#ac8a8c",
  light_pink = "#de878f",
  pink = "#e89199",
  line = "#2d3339",
  green = "#8aac8b",
  light_green = "#9ec49f",
  blue = "#6b8bab",
  nord_blue = "#7797b7",
  yellow = "#c4c19e",
  sun = "#aca98a",
  purple = "#a39ec4",
  dark_purple = "#8f8aac",
  teal = "#7c9cbc",
  orange = "#c9938a",
  cyan = "#9aafe6",
  bg_statusline = "#1e242a",
  bg_light = "#2d3339",
  bg_pmenu = "#8aac8b",
  bg_folder = "#6b8bab",
}

require("aiko.theme").paint(colorscheme)
