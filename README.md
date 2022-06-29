<div align="center">
      <h1> <img src="https://i.postimg.cc/WpQzgxVh/plugin-Icon.png" width="80px"><br/>gruvbox.nvim</h1>
     </div>
<p align="center"> 
      <a href="https://twitter.com/intent/user?screen_name=ellisonleao" target="_blank"><img alt="Twitter Follow" src="https://img.shields.io/twitter/follow/ellisonleao?style=for-the-badge" style="vertical-align:center" ></a>
      <a href="#"><img alt="Made with Lua" src="https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua" style="vertical-align:center" /></a>
</p>

A port of [gruvbox community](https://github.com/gruvbox-community/gruvbox) theme to lua with [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) support!

<p align="center">
    <img src="https://i.postimg.cc/fy3tnGFt/gruvbox-themes.png" />
</p>

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

# Basic Usage

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

Additional settings for gruvbox are:

```lua
-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true, -- will make italic comments and special strings
  inverse = false, -- invert background for search, diffs, statuslines and errors
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  contrast = "", -- can be "hard" or "soft"
  overrides = {},
})
vim.cmd("colorscheme gruvbox")
```

## Overriding Highlight groups

If you don't enjoy the current color for a specific highlight group, now you can just override it in the setup. For
example:

```lua
require("gruvbox").setup({
    overrides = {
        SignColumn = {bg = "#ff9900"}
    }
})
vim.cmd("colorscheme gruvbox")
```

Please note that the override values must follow the attributes from the highlight group map, such as:

- **fg** - foreground color
- **bg** - background color
- **bold** - true or false for bold font
- **italic** - true or false for italic font

Other values can be seen in `:h synIDattr`

# Additional supported plugins

- [vim-signify](https://github.com/mhinz/vim-signify)
- [vim-startify](https://github.com/mhinz/vim-startify)
- [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

And more..
