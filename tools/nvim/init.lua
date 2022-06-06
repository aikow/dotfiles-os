local present, impatient = pcall(require, "impatient")

if present then
  impatient.enable_profile()
end

require("aiko")

-- Setup packer and plugins
require("aiko.packer").bootstrap()
require("aiko.packer").setup()

vim.filetype.add({
  extension = {
    wiki = "markdown",
    tmux = "tmux",
  },
  filename = {
    ["MANIFEST.in"] = "manifest",
    [".gitignore"] = "gitignore",
  },
  pattern = {
    ["Dockerfile.*"] = "dockerfile",
  },
})
