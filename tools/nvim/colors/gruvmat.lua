local colorscheme = {
  name = "gruvmat",
  background = "dark",
}

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
  darker_black = "#232323",
  black = "#282828",
  black2 = "#2e2e2e",
  one_bg = "#353535",
  one_bg2 = "#3f3f3f",
  one_bg3 = "#444444",
  grey = "#464646",
  grey_fg = "#4e4e4e",
  grey_fg2 = "#505050",
  light_grey = "#656565",
  red = "#fb4934",
  baby_pink = "#cc241d",
  pink = "#ff75a0",
  line = "#36393a",
  green = "#b8bb26",
  vibrant_green = "#a9b665",
  nord_blue = "#83a598",
  blue = "#458588",
  yellow = "#d79921",
  sun = "#fabd2f",
  purple = "#b4bbc8",
  dark_purple = "#d3869b",
  teal = "#749689",
  orange = "#e78a4e",
  cyan = "#82b3a8",
  statusline_bg = "#2c2c2c",
  lightbg = "#3d3d3d",
  pmenu_bg = "#83a598",
  folder_bg = "#749689",
}

local colors = {
  grey0 = { "#7c6f64", "243" },
  grey1 = { "#928374", "245" },
  grey2 = { "#a89984", "246" },

  fg0 = { "#d4be98", "223" },
  fg1 = { "#ddc7a1", "223" },
  red = { "#ea6962", "167" },
  orange = { "#e78a4e", "208" },
  yellow = { "#d8a657", "214" },
  green = { "#a9b665", "142" },
  aqua = { "#89b482", "108" },
  blue = { "#7daea3", "109" },
  purple = { "#d3869b", "175" },
  bg_red = { "#ea6962", "167" },
  bg_green = { "#a9b665", "142" },
  bg_yellow = { "#d8a657", "214" },

  bg0 = { "#282828", "235" },
  bg1 = { "#32302f", "236" },
  bg2 = { "#32302f", "236" },
  bg3 = { "#45403d", "237" },
  bg4 = { "#45403d", "237" },
  bg5 = { "#5a524c", "239" },
  bg_statusline1 = { "#32302f", "236" },
  bg_statusline2 = { "#3a3735", "236" },
  bg_statusline3 = { "#504945", "240" },
  bg_diff_green = { "#34381b", "22" },
  bg_visual_green = { "#3b4439", "22" },
  bg_diff_red = { "#402120", "52" },
  bg_visual_red = { "#4c3432", "52" },
  bg_diff_blue = { "#0e363e", "17" },
  bg_visual_blue = { "#374141", "17" },
  bg_visual_yellow = { "#4f422e", "94" },
  bg_current_word = { "#3c3836", "237" },
}

require("aiko.ui.colorscheme").paint(colorscheme)
