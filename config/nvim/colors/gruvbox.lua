local Colorscheme = require("aiko.theme.colorscheme").Colorscheme

local colorscheme = Colorscheme.new({
  name = "gruvbox",
  background = "dark",
})

colorscheme.theme = {
  base00 = "#282828",
  base01 = "#3c3836",
  base02 = "#504945",
  base03 = "#665c54",
  base04 = "#bdae93",
  base05 = "#d5c4a1",
  base06 = "#ebdbb2",
  base07 = "#fbf1c7",
  base08 = "#fb4934",
  base09 = "#fe8019",
  base0A = "#fabd2f",
  base0B = "#b8bb26",
  base0C = "#8ec07c",
  base0D = "#83a598",
  base0E = "#d3869b",
  base0F = "#d65d0e",
}

colorscheme.colors = {
  white = "#ebdbb2",
  dark_black = "#232323",
  black = "#282828",
  bg_1 = "#2e2e2e",
  bg_2 = "#353535",
  bg_3 = "#3f3f3f",
  bg_4 = "#444444",
  grey = "#464646",
  light_grey_1 = "#4e4e4e",
  light_grey_2 = "#505050",
  light_grey_3 = "#656565",
  red = "#fb4934",
  light_pink = "#cc241d",
  pink = "#ff75a0",
  line = "#36393a",
  green = "#b8bb26",
  light_green = "#a9b665",
  nord_blue = "#83a598",
  blue = "#458588",
  yellow = "#d79921",
  sun = "#fabd2f",
  purple = "#b4bbc8",
  dark_purple = "#d3869b",
  teal = "#749689",
  orange = "#e78a4e",
  cyan = "#82b3a8",
  bg_statusline = "#2c2c2c",
  bg_light = "#3d3d3d",
  bg_pmenu = "#83a598",
  bg_folder = "#749689",
}

require("aiko.theme").paint(colorscheme)
