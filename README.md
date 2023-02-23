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

Neovim 0.8.0+

# Installing

Using `packer`

```lua
use { "ellisonleao/gruvbox.nvim" }
```

Using `lazy.nvim`
```lua
-- It is adviced to put colorschemes with higher priority
{'ellisonleao/gruvbox.nvim', priority=1000}
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
vim.cmd.colorscheme("gruvbox")
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
  italic = true,
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
vim.cmd.colorscheme("gruvbox")
```

## Overriding

Note: with 'NVIM v0.9.0+', you can now use `:Inspect` to see the highlight groups of the text under the cursor.

### Pallette

You can specify your own palette colors. For example:

```lua
require("gruvbox").setup({
    palette_overrides = {
        bright_green = "#990000",
    }
})
vim.cmd.colorscheme("gruvbox")
```

More colors in the [palette.lua](lua/gruvbox/palette.lua) file

### Highlight groups

If you don't enjoy the current color for a specific highlight group, now you can just override it in the setup. For
example:

```lua
require("gruvbox").setup({
    overrides = {
        SignColumn = {bg = "#ff9900"}
    }
})
vim.cmd.colorscheme("gruvbox")
```

Please note that the override values must follow the attributes from the highlight group map, such as:

- **fg** - foreground color
- **bg** - background color
- **bold** - true or false for bold font
- **italic** - true or false for italic font

Other values can be seen in `:h synIDattr`


### Teesitter
If you use [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) you may want to override the highlight groups for it. For example:

```lua
require("gruvbox").setup({
  overrides = {
    ["@comment"] = {bg = "#3c3836", fg = "#0E1018"},
    ["@text.note"] = {bold = true, reverse = false, fg = "", bg = "#213352"},
    ["@constant.builtin"] = { link = "GruvboxPurple"},
    -- note with treesitter you may change highlights for specific languages
    -- for example:
    ["@namespace.latex"] = { link = "Include" },
  }
})
```

All the captures groups may be found in `:help treesitter-highlight-groups`


## Example configuration in lua

```lua
--- This uses lazy.nvim
require("lazy").setup({
    {'ellisonleao/gruvbox.nvim', priority=1000, config = function()
        require("gruvbox").setup({
            contrast = "hard",
            palette_overrides = {
                dark0_hard = "#0E1018",
            },
            overrides = {
                SignColumn = {bg = "#ff9900"},
                Define = {link = "GruvboxPurple"},
                Macro = {link = "GruvboxPurple"},
                Comment = {fg = "#fe8019", italic = true},
                
                ["@constant.builtin"] = { link = "GruvboxPurple"},
                ["@storageclass.lifetime"] = { link = "GruvboxAqua"},
                ["@text.note"] = { link = "TODO" },
                ["@namespace.latex"] = { link = "Include" },
                
                Folded = {italic = true, fg = "#fe8019", bg = "#3c3836"},
                FoldColumn = {fg = "#fe8019", bg = "#0E1018"},
                DiffAdd = {bold = true, reverse = false, fg = "", bg = "#2a4333"},
                DiffChange = {bold = true, reverse = false, fg = "", bg = "#333841"},
                DiffDelete = { bold = true, reverse = false, fg = "#442d30", bg = "#442d30"},
                DiffText = {bold = true, reverse = false, fg = "", bg = "#213352"},

                ContextVt = {fg = "#878787"},
                DiagnosticVirtualTextWarn = {fg = "#dfaf87"},
                
                GruvboxOrangeSign = {fg = "#dfaf87", bg = ""},
                GruvboxAquaSign = {fg = "#8EC07C", bg = ""},
                GruvboxGreenSign = {fg = "#b8bb26", bg = ""},
                GruvboxRedSign = {fg = "#fb4934", bg = ""},
                GruvboxBlueSign = {fg = "#83a598", bg = ""},
                WilderMenu = {fg = "#ebdbb2", bg = ""},
                WilderAccent = {fg = "#f4468f", bg = ""}
            }
        })
        vim.cmd.colorscheme("gruvbox")
    end},
})

```
