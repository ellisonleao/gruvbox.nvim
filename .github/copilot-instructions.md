# Copilot Instructions for gruvbox.nvim

## Repository Overview

**gruvbox.nvim** is a Neovim colorscheme plugin that ports the popular gruvbox community theme to Lua with treesitter and semantic highlighting support. This is a single-module Lua plugin targeting Neovim 0.8.0+ with extensive customization capabilities.

**Key Stats:**
- Primary language: Lua
- Target runtime: Neovim 0.10.0+
- License: MIT
- Architecture: Single module with configuration-driven design

## Project Structure

### Core Files
- `lua/gruvbox.lua` - Main implementation (1,343 lines) containing all colorscheme logic
- `colors/gruvbox.lua` - Simple loader that calls `require("gruvbox").load()`
- `README.md` - User documentation with installation and configuration examples
- `doc/gruvbox.nvim.txt` - Auto-generated Vim help documentation

### Testing Infrastructure
- `tests/gruvbox/gruvbox_spec.lua` - Test suite (189 lines) using plenary.nvim
- `tests/minimal_init.lua` - Test setup that auto-downloads plenary.nvim if missing
- `Makefile` - Contains `test` target for running tests

### Configuration
- `stylua.toml` - Code formatting configuration (120 char width, 2-space indent)
- `.github/workflows/` - CI/CD automation (test, docs, luarocks publishing)

## Build and Validation Commands

### Prerequisites
- **Neovim 0.10.0+** is REQUIRED - tests and functionality will fail on older versions
- **stylua** for code formatting (auto-installed in CI)
- **plenary.nvim** for testing (auto-downloaded by test setup)

### Validated Command Sequences

#### Testing (Always works - tested)
```bash
make test
```
- Downloads plenary.nvim to `/tmp/plenary.nvim` if not present
- Runs all tests using Neovim headless mode
- **Expected result:** All tests passing and no errors
- **Dependencies:** Requires `nvim` in PATH

#### Code Formatting (Always works - tested)
```bash
stylua --check lua
```
- Validates Lua code formatting against stylua.toml config
- **Expected result:** No output means code is properly formatted
- **To fix formatting:** `stylua lua` (without --check flag)

#### Manual Loading Test
```bash
nvim --headless -c "set rtp+=$PWD" -c "lua require('gruvbox').setup()" -c "colorscheme gruvbox" -c "echo 'Colorscheme loaded successfully'" -c "q"
```
- Quick test to ensure colorscheme loads without errors
- Should print "Colorscheme loaded successfully" and exit cleanly
- **Note:** Requires setting runtime path to current directory

### CI/CD Pipeline

**GitHub Actions workflows (all validated):**

1. **test.yml** - Runs on push/PR
   - Tests on Neovim stable and nightly
   - Runs stylua formatting check
   - Runs full test suite

2. **docs.yml** - Runs on main branch push
   - Auto-generates `doc/gruvbox.nvim.txt` from README.md using panvimdoc
   - Commits changes automatically

3. **luarocks.yml** - Runs on version tags
   - Publishes releases to LuaRocks

## Architecture and Key Concepts

### Main Module Structure (`lua/gruvbox.lua`)
- **Gruvbox table**: Main module with `config`, `palette`, `setup()`, and `load()` methods
- **Configuration system**: Deep-mergeable config with extensive defaults
- **Color palette**: Comprehensive gruvbox color definitions with override support
- **Highlight groups**: Extensive definitions covering core Vim, treesitter, LSP, and plugin integrations

### Critical Implementation Details
- `setup()` must be called BEFORE `colorscheme gruvbox` command
- Configuration is deep-copied and merged to prevent mutation
- Multiple `setup()` calls are independent (previous state is not preserved)
- Supports both light and dark backgrounds with contrast levels (hard/soft/normal)

### Plugin Integrations
The colorscheme includes highlights for 40+ plugins including:
- Treesitter and LSP semantic tokens
- Popular plugins: telescope, nvim-tree, gitsigns, lualine, etc.
- Terminal colors support for integrated terminal

## Common Development Workflows

### Making Changes to Colors
1. Edit `lua/gruvbox.lua` in the palette section or highlight groups
2. Test with `nvim -c "lua require('gruvbox').setup()" -c "colorscheme gruvbox"`
3. Run `make test` to ensure no regressions
4. Run `stylua lua` to format code

### Adding New Plugin Support
1. Add highlight group definitions in the `groups` table within `get_groups()` function
2. Follow existing patterns for naming (use plugin name prefix)
3. Test with the target plugin installed
4. Add tests in `tests/gruvbox/gruvbox_spec.lua` if needed

### Configuration Changes
1. Update `default_config` table for new options
2. Update type annotations (`@class GruvboxConfig`)
3. Handle new options in `get_groups()` function
4. Update README.md with examples
5. Tests are auto-updated for documentation

## Error Patterns and Solutions

### Common Issues
- **"gruvbox.nvim: you must use neovim 0.8 or higher"**: Version check failure - use newer Neovim
- **Test failures**: Usually indicate breaking changes to configuration or highlight logic
- **Formatting failures**: Run `stylua lua` to fix formatting issues

### Debugging Workflow
1. Use `:hi` command in Neovim to inspect highlight groups
2. Use `:lua print(vim.inspect(require('gruvbox').config))` to debug configuration
3. Test color changes with `:lua require('gruvbox').load()` for quick iteration

## Files and Dependencies Not Obvious from Structure

### Hidden Dependencies
- Tests depend on `plenary.nvim` but auto-download it
- Documentation generation depends on `panvimdoc` action
- LuaRocks publishing requires `LUAROCKS_API_KEY` secret

### Generated Files
- `doc/gruvbox.nvim.txt` - Auto-generated, don't edit manually
- Documentation updates trigger on main branch pushes

## Repository Root Files
```
.
├── .github/           # CI/CD workflows and issue templates
├── .gitignore         # Excludes build artifacts and test dependencies  
├── LICENSE            # MIT license
├── Makefile           # Test automation
├── README.md          # User documentation and examples
├── colors/            # Vim colorscheme loader
├── doc/               # Auto-generated vim help documentation
├── lua/               # Main Lua implementation
├── stylua.toml        # Code formatting configuration
└── tests/             # Test suite with plenary.nvim
```

## Trust These Instructions

These instructions are comprehensive and tested. Only search for additional information if you encounter errors or if specific requirements aren't covered above. The command sequences have been validated and the architectural information is current as of the latest codebase analysis.

**Always run `make test` before making changes to understand the current state, and run it again after changes to ensure no regressions.**
