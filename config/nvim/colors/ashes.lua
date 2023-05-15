local colorscheme = require("aiko.theme.colorscheme").Scheme:new({
  name = "ashes",
  background = "dark",
})

colorscheme.theme = {
  base00 = "#1c2023",
  base01 = "#272b2e",
  base02 = "#303437",
  base03 = "#44484b",
  base04 = "#adb3ba",
  base05 = "#c7ccd1",
  base06 = "#dfe2e5",
  base07 = "#f3f4f5",
  base08 = "#c7ae95",
  base09 = "#c7c795",
  base0A = "#aec795",
  base0B = "#95c7ae",
  base0C = "#95aec7",
  base0D = "#ae95c7",
  base0E = "#c795ae",
  base0F = "#c79595",
}

colorscheme.colors = {
  bg_1 = "#24282b",
  bg_2 = "#272b2e",
  bg_3 = "#303437",
  bg_4 = "#3a3e41",
  bg_folder = "#8ca5be",
  bg_light = "#303437",
  bg_pmenu = "#99c366",
  bg_statusline = "#23272a",
  black = "#1c2023",
  blue = "#95aec7",
  cyan = "#9eb7d0",
  dark_black = "#161a1d",
  dark_purple = "#a58cbe",
  green = "#aec795",
  grey = "#44484b",
  light_green = "#95c7ae",
  light_grey_1 = "#4a4e51",
  light_grey_2 = "#515558",
  light_grey_3 = "#565a5d",
  light_pink = "#d09eb7",
  line = "#303437",
  nord_blue = "#8ca5be",
  orange = "#c7ae95",
  pink = "#c795ae",
  purple = "#ae95c7",
  red = "#c79595",
  sun = "#d0d09e",
  teal = "#8fb4b5",
  white = "#c7ccd1",
  yellow = "#c7c795",
}

colorscheme.polish = {}

require("aiko.theme").paint(colorscheme)
