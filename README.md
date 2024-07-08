<div align="center">
      <h1> <img src="https://i.postimg.cc/WpQzgxVh/plugin-Icon.png" width="80px"><br/>gruvbox.nvim</h1>
     </div>
<p align="center"> 
      <a href="https://twitter.com/intent/user?screen_name=ellisonleao" target="_blank"><img alt="Twitter Follow" src="https://img.shields.io/twitter/follow/ellisonleao?style=for-the-badge" style="vertical-align:center" ></a>
      <a href="#"><img alt="Made with Lua" src="https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua" style="vertical-align:center" /></a>
</p>

A port of [gruvbox community](https://github.com/gruvbox-community/gruvbox) theme to lua with [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) and [semantic highlights](https://neovim.io/doc/user/lsp.html#lsp-semantic-highlight) support!

<p align="center">
    <img src="https://i.postimg.cc/fy3tnGFt/gruvbox-themes.png" />
</p>

# Prerequisites

Neovim 0.8.0+

# Installing

## Using `packer`

```lua
use { "ellisonleao/gruvbox.nvim" }
```

## Using `lazy.nvim`

```lua
{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}
```

## Using `vim-plug`

```vim
Plug 'ellisonleao/gruvbox.nvim'
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
-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
```

**VERY IMPORTANT**: Make sure to call setup() **BEFORE** calling the colorscheme command, to use your custom configs

## Overriding

### Palette

You can specify your own palette colors. For example:

```lua
require("gruvbox").setup({
    palette_overrides = {
        bright_green = "#990000",
    }
})
vim.cmd("colorscheme gruvbox")
```

### Highlight groups

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

It also works with treesitter groups and lsp semantic highlight tokens

```lua
require("gruvbox").setup({
    overrides = {
        ["@lsp.type.method"] = { bg = "#ff9900" },
        ["@comment.lua"] = { bg = "#000000" },
    }
})
vim.cmd("colorscheme gruvbox")
```

`overrides` can also be a `function(colors)` which returns table of overriden groups

```lua
require("gruvbox").setup({
    overrides = function(colors)
        return {
            Title = { link = "GruvboxYellowBold" },
            ["@comment"] = { fg = colors.gray, italic = true, bold = false },
        }
    end
})
vim.cmd("colorscheme gruvbox")
```

`colors` has those fields:
  * `bg0`, `bg1`, `bg2`, `bg3`, `bg4`,
  * `fg0`, `fg1`, `fg2`, `fg3`, `fg4`,
  * `red`, `green`, `yellow`, `blue`, `purple`, `aqua`, `orange`, `gray`,
  * `neutral_red`, `neutral_green`, `neutral_yellow`, `neutral_blue`, `neutral_purple`, `neutral_aqua`,
  * `dark_red`, `dark_green`, `dark_aqua`.

Please note that the override values must follow the attributes from the highlight group map, such as:

- **fg** - foreground color
- **bg** - background color
- **bold** - true or false for bold font
- **italic** - true or false for italic font

Other values can be seen in [`synIDattr`](<https://neovim.io/doc/user/builtin.html#synIDattr()>)
