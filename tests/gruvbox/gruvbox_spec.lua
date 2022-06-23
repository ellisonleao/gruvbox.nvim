local gruvbox = require("gruvbox")

describe("setup", function()
  it("works with default values", function()
    local expected = {
      undercurl = true,
      underline = true,
      bold = true,
      italic = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      contrast = "hard",
      overrides = {},
    }

    gruvbox.setup()
    assert.are.same(gruvbox.config, expected)
  end)

  it("works with config overrides", function()
    local expected = {
      undercurl = false,
      underline = false,
      bold = true,
      italic = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      contrast = "hard",
      overrides = {},
    }

    gruvbox.setup({ undercurl = false, underline = false })
    assert.are.same(gruvbox.config, expected)
  end)
end)
