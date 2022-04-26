<div align="center">
      <h1> <img src="https://i.postimg.cc/WpQzgxVh/plugin-Icon.png" width="80px"><br/>gruvbox.nvim</h1>
     </div>
<p align="center"> 
      <a href="https://twitter.com/intent/user?screen_name=ellisonleao" target="_blank"><img alt="Twitter Follow" src="https://img.shields.io/twitter/follow/ellisonleao?style=for-the-badge" style="vertical-align:center" ></a>
      <a href="#"><img alt="Made with Lua" src="https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua" style="vertical-align:center" /></a>
</p>

A port of [gruvbox community](https://github.com/gruvbox-community/gruvbox) theme to lua with [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support!

# Prerequisites

Neovim 0.7.0+

# Installing

Using `vim-plug`

```vim
Plug 'ellisonleao/gruvbox.nvim'
```

Using `packer`

```lua
use { "ellisonleao/gruvbox.nvim" }
```

# Usage

Inside `init.vim`

```vim
set background=dark " or light if you want light mode
colorscheme gruvbox
```

Inside `init.lua`

```lua
vim.opt.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
```

# Configuration

all `g:gruvbox_` configs are the same [as the original one](https://github.com/morhetz/gruvbox/wiki/Configuration) except for `g:gruvbox_guisp_fallback`

# Additional supported plugins

- [vim-signify](https://github.com/mhinz/vim-signify)
- [vim-startify](https://github.com/mhinz/vim-startify)
- [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

And more..

# Screenshots

## dark mode

![Screenshot-from-2021-02-25-11-41-18.png](https://i.postimg.cc/66fSHrV8/Screenshot-from-2021-02-25-11-41-18.png)

## light mode

![Screenshot-from-2021-02-25-11-41-33.png](https://i.postimg.cc/pXVS3mkq/Screenshot-from-2021-02-25-11-41-33.png)
