" let g:colors_name="gruvbox"
" reloading colors
lua package.loaded["gruvbox"] = nil
lua require("lush")(require("gruvbox"))
