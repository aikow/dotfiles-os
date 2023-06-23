local colorscheme = require("aiko.base46.base46").Base46:new({
  name = "bearded-arc",
  background = "dark",
})

colorscheme.theme = {
  base00 = "#1c2433",
  base01 = "#262e3d",
  base02 = "#303847",
  base03 = "#444c5b",
  base04 = "#a1adb7",
  base05 = "#c3cfd9",
  base06 = "#abb7c1",
  base07 = "#08bdba",
  base08 = "#ff738a",
  base09 = "#ff955c",
  base0A = "#eacd61",
  base0B = "#3cec85",
  base0C = "#77aed7",
  base0D = "#69c3ff",
  base0E = "#22ecdb",
  base0F = "#ff738a",
}

colorscheme.colors = {
  bg_1 = "#232b3a",
  bg_2 = "#262e3d",
  bg_3 = "#303847",
  bg_4 = "#3a4251",
  bg_folder = "#69c3ff",
  bg_light = "#303847",
  bg_pmenu = "#3cec85",
  bg_statusline = "#232b3a",
  black = "#1c2433",
  blue = "#69c3ff",
  cyan = "#22ecdb",
  dark_black = "#151d2c",
  dark_purple = "#b78aff",
  green = "#3cec85",
  grey = "#444c5b",
  light_green = "#9bdead",
  light_grey_1 = "#4e5665",
  light_grey_2 = "#58606f",
  light_grey_3 = "#626a79",
  light_pink = "#f38cec",
  line = "#303847",
  nord_blue = "#6da4cd",
  orange = "#ff955c",
  pink = "#ee9cdd",
  purple = "#b788e5",
  red = "#ff738a",
  sun = "#f6d96d",
  teal = "#12c7c4",
  white = "#abb7c1",
  yellow = "#eacd61",
}

colorscheme.polish = {
  ["@constructor"] = {},
  ["@keyword.return"] = { fg = "#EACD61" },
  ["@parameter"] = { fg = colorscheme.colors.pink },
  ["@punctuation.bracket"] = { fg = "#B78AFF" },
  Conditional = { fg = "#EACD61" },
  Include = { fg = "#EACD61" },
}

require("aiko.base46").paint(colorscheme)
