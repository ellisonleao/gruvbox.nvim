require("plenary.reload").reload_module("gruvbox", true)
local gruvbox = require("gruvbox")

describe("setup", function()
  it("works with default values", function()
    local expected = {
      undercurl = true,
      underline = true,
      bold = true,
      strikethrough = true,
      italic = true,
      inverse = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      contrast = "",
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    }

    gruvbox.setup()
    assert.are.same(gruvbox.config, expected)
  end)

  it("works with config overrides", function()
    local expected = {
      undercurl = false,
      underline = false,
      bold = true,
      strikethrough = true,
      italic = true,
      inverse = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      contrast = "",
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    }

    gruvbox.setup({ undercurl = false, underline = false })
    assert.are.same(gruvbox.config, expected)
  end)
end)

describe("highlight overrides", function()
  it("should override a hightlight color", function()
    local config = {
      overrides = {
        Search = { fg = "#ff9900", bg = "#000000" },
        ColorColumn = { bg = "#ff9900" },
      },
    }

    gruvbox.setup(config)
    gruvbox.load()

    local search_group_id = vim.api.nvim_get_hl_id_by_name("Search")
    local search_values = {
      background = vim.fn.synIDattr(search_group_id, "bg", "gui"),
      foreground = vim.fn.synIDattr(search_group_id, "fg", "gui"),
    }

    assert.are.same(search_values, { background = "#000000", foreground = "#ff9900" })

    local color_column_group_id = vim.api.nvim_get_hl_id_by_name("ColorColumn")
    local color_column_values = {
      background = vim.fn.synIDattr(color_column_group_id, "bg", "gui"),
    }

    assert.are.same(color_column_values, { background = "#ff9900" })
  end)

  it("should create new hightlights colors if they dont exist", function()
    local config = {
      overrides = {
        Search = { fg = "#ff9900", bg = "#000000" },
        New = { bg = "#ff9900" },
      },
    }

    gruvbox.setup(config)
    gruvbox.load()

    local search_group_id = vim.api.nvim_get_hl_id_by_name("Search")
    local search_values = {
      background = vim.fn.synIDattr(search_group_id, "bg", "gui"),
      foreground = vim.fn.synIDattr(search_group_id, "fg", "gui"),
    }

    assert.are.same(search_values, { background = "#000000", foreground = "#ff9900" })

    local new_group_id = vim.api.nvim_get_hl_id_by_name("New")
    local new_group_values = {
      background = vim.fn.synIDattr(new_group_id, "bg", "gui"),
    }

    assert.are.same(new_group_values, { background = "#ff9900" })
  end)

  it("should override links", function()
    local config = {
      overrides = {
        Function = { bg = "#990000" },
      },
    }

    gruvbox.setup(config)
    gruvbox.load()

    local group_id = vim.api.nvim_get_hl_id_by_name("Function")
    local values = {
      background = vim.fn.synIDattr(group_id, "bg", "gui"),
    }
    assert.are.same(values, { background = "#990000" })
  end)

  it("should override palette", function()
    local config = {
      palette_overrides = {
        bright_green = "#990000",
      },
    }

    gruvbox.setup(config)
    gruvbox.load()

    local group_id = vim.api.nvim_get_hl_id_by_name("Function")
    local values = {
      background = vim.fn.synIDattr(group_id, "bg", "gui"),
    }
    assert.are.same(values, { background = "#990000" })
  end)
end)
