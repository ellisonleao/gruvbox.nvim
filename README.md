# gruvbox.nvim

A port of [gruvbox community](https://github.com/gruvbox-community/gruvbox) theme to lua with [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support!

Please note that this plugin is under active development right now, so the status for it is still alpha. Please file issues if you find any bugs.

# Installing

Using `vim-plug`

```vim
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
```

Using `packer`

```lua
use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
```

# Usage

Inside `init.vim`

```vim
set background=dark " or light if you want light mode
colorscheme gruvbox
```

Inside `init.lua`
```lua
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
```

# Configuration

all `g:gruvbox_` configs are the same [as the original one](https://github.com/morhetz/gruvbox/wiki/Configuration) except for `g:gruvbox_guisp_fallback`

# Additional supported plugins

- [vim-signify](https://github.com/mhinz/vim-signify)
- [vim-startify](https://github.com/mhinz/vim-startify)
- [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

More to be added..

# Screenshots

## dark mode

![Screenshot-from-2021-02-25-11-41-18.png](https://i.postimg.cc/66fSHrV8/Screenshot-from-2021-02-25-11-41-18.png)

## light mode

![Screenshot-from-2021-02-25-11-41-33.png](https://i.postimg.cc/pXVS3mkq/Screenshot-from-2021-02-25-11-41-33.png)
