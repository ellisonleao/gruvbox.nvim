# gruvbox.nvim

A port of [gruvbox community](https://github.com/gruvbox-community/gruvbox) theme to lua.

Please note that this plugin is under active development right now, so the status for it is still
alpha.

# Installing

Using `vim-plug`

```
Plug 'tjdevries/colorbuddy.nvim' # required
Plug 'npxbr/gruvbox.nvim'
```

# Usage

Inside `init.vim`

```lua
lua require("colorbuddy").colorscheme("gruvbox")

or

lua require("colorbuddy").colorscheme("gruvbox", "light") -- for light mode
```

# Configuration

all `g:gruvbox_` configs are the same [as the original one](https://github.com/morhetz/gruvbox/wiki/Configuration) except for `g:gruvbox_guisp_fallback`

# Supported plugins

- [vim-signify](https://github.com/mhinz/vim-signify)
- [vim-startify](https://github.com/mhinz/vim-startify)
- [galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim)

More to be added..
