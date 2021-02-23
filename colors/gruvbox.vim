set background=dark
let g:colors_name="gruvbox"
" reloading colors
lua package.loaded["gruvbox.theme"] = nil
lua require("lush")(require("gruvbox.theme"))
