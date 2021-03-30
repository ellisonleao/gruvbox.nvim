" reloading all gruvbox highlights
lua package.loaded["gruvbox"] = nil
lua package.loaded["gruvbox.base"] = nil
lua package.loaded["gruvbox.plugins.highlights"] = nil
lua package.loaded["gruvbox.languages"] = nil
lua require("lush")(require("gruvbox"))
