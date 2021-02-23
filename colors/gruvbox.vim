set background=dark
let g:colors_name="gruvbox"
" reloading colors
lua package.loaded["gruvbox.lush_template"] = nil
lua require("lush")(require("gruvbox.lush_template"))
