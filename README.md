# gruvbox.nvim

A port of [gruvbox community](https://github.com/gruvbox-community/gruvbox) theme to lua with [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support!

Please note that this plugin is under active development right now, so the status for it is still alpha.

# Installing

Using `vim-plug`

```
Plug 'rktjmp/lush.nvim' # required
Plug 'npxbr/gruvbox.nvim'
```

Using `packer`

```
use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
```

# Usage

Inside `init.vim`

```vimscript
set background=dark
set colorscheme=gruvbox
```

```lua
vim.o.background = "dark"
vim.o.colorscheme = "gruvbox"
```

# Configuration

all `g:gruvbox_` configs are the same [as the original one](https://github.com/morhetz/gruvbox/wiki/Configuration) except for `g:gruvbox_guisp_fallback`

# Supported plugins

- [vim-signify](https://github.com/mhinz/vim-signify)
- [vim-startify](https://github.com/mhinz/vim-startify)

More to be added..
