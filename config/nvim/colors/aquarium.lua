local colorscheme = require("aiko.base46.base46").Base46:new({
  name = "aquarium",
  background = "dark",
})

colorscheme.theme = {
  base00 = "#20202a",
  base01 = "#2c2e3e",
  base02 = "#3d4059",
  base03 = "#313449",
  base04 = "#63718b",
  base05 = "#bac0cb",
  base06 = "#c5cbd6",
  base07 = "#ced4df",
  base08 = "#ebb9b9",
  base09 = "#e8cca7",
  base0A = "#e6dfb8",
  base0B = "#b1dba4",
  base0C = "#b8dceb",
  base0D = "#a3b8ef",
  base0E = "#f6bbe7",
  base0F = "#eac1c1",
}

colorscheme.colors = {
  bg_1 = "#25252f",
  bg_2 = "#2a2a34",
  bg_3 = "#34343e",
  bg_4 = "#3e3e48",
  bg_folder = "#b8dceb",
  bg_light = "#2e2e38",
  bg_pmenu = "#ebb9b9",
  bg_statusline = "#262630",
  black = "#20202a",
  blue = "#cddbf9",
  cyan = "#b8dceb",
  dark_black = "#1c1c26",
  dark_purple = "#e8b6e9",
  green = "#b1dba4",
  grey = "#484852",
  light_green = "#bee0a8",
  light_grey_1 = "#4e4e58",
  light_grey_2 = "#54545e",
  light_grey_3 = "#5a5a64",
  light_pink = "#eac1c1",
  line = "#2d2d37",
  nord_blue = "#bccaeb",
  orange = "#e8cca7",
  pink = "#e9d1d1",
  purple = "#f6bbe7",
  red = "#ebb9b9",
  sun = "#eee8ba",
  teal = "#aedcb7",
  white = "#ced4df",
  yellow = "#e6dfb8",
}

require("aiko.base46").paint(colorscheme)
