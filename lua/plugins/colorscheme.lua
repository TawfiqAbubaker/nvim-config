-- "UFC green": mirrors the ufc-green theme from Herdr (~/.config/herdr-app/themes/ufc-green.json).
-- Implemented as a custom tokyonight palette so every plugin tokyonight styles picks it up.

-- Herdr ufc-green source colors
local ufc = {
  chrome = "#0b0c0b",
  surface = "#121312",
  popover = "#171817",
  hover = "#1a1b1a",
  raised = "#1c1e1c",
  selected = "#222422",
  border = "#212321",
  input = "#2e312e",
  selection = "#2a2e2b",
  muted = "#8c918d",
  dim = "#5f6460",
  fg = "#cbcecb",
  fg_bright = "#eff1ef",
  red = "#e0626a",
  red_bright = "#ec7a80",
  ufc_red = "#d20a0a", -- the UFC logo red
  green = "#8fc48a",
  green_bright = "#a6d6a0",
  yellow = "#e3c27a",
  blue = "#6fa8dc",
  blue_bright = "#89bbe8",
  magenta = "#b98ad6",
  magenta_bright = "#cba3e2",
  cyan = "#5fb8ad",
  cyan_bright = "#7ccbc1",
}

---@type Palette
local palette = {
  bg = ufc.surface,
  bg_dark = ufc.chrome,
  bg_dark1 = "#070807",
  bg_highlight = ufc.raised,
  blue = ufc.blue,
  blue0 = "#3a5c38", -- search / visual base (green-tinted)
  blue1 = ufc.blue_bright,
  blue2 = ufc.cyan,
  blue5 = ufc.cyan_bright,
  blue6 = ufc.green_bright,
  blue7 = "#2b4540", -- diff change
  comment = "#6e746f",
  cyan = ufc.cyan_bright,
  dark3 = ufc.dim,
  dark5 = ufc.muted,
  fg = ufc.fg,
  fg_dark = ufc.muted,
  fg_gutter = ufc.input,
  green = ufc.green,
  green1 = ufc.cyan_bright,
  green2 = ufc.cyan,
  magenta = ufc.magenta,
  magenta2 = ufc.ufc_red,
  orange = "#e8a072",
  purple = ufc.magenta_bright,
  red = ufc.red,
  red1 = "#e5383b",
  teal = ufc.cyan,
  terminal_black = ufc.dim,
  yellow = ufc.yellow,
  git = {
    add = ufc.green,
    change = ufc.blue,
    delete = ufc.red,
  },
}

return {
  {
    "folke/tokyonight.nvim",
    opts = function(_, opts)
      require("tokyonight.colors").styles.ufc = palette
      return vim.tbl_deep_extend("force", opts or {}, {
        style = "ufc",
        on_colors = function(c)
          -- match Herdr's chrome: dark borders, green accent on focus
          c.border = ufc.border
          c.border_highlight = ufc.green
          c.bg_visual = ufc.selection
          c.bg_search = "#3a5c38"
          c.error = c.red1
          c.terminal = {
            black = "#1e201e",
            black_bright = ufc.dim,
            red = ufc.red,
            red_bright = ufc.red_bright,
            green = ufc.green,
            green_bright = ufc.green_bright,
            yellow = ufc.yellow,
            yellow_bright = "#f0d390",
            blue = ufc.blue,
            blue_bright = ufc.blue_bright,
            magenta = ufc.magenta,
            magenta_bright = ufc.magenta_bright,
            cyan = ufc.cyan,
            cyan_bright = ufc.cyan_bright,
            white = ufc.fg,
            white_bright = ufc.fg_bright,
          }
        end,
        on_highlights = function(hl, c)
          hl.CursorLine = { bg = ufc.hover }
          hl.CursorLineNr = { fg = ufc.green, bold = true }
          hl.LineNr = { fg = ufc.dim }
          hl.WinSeparator = { fg = ufc.border, bold = true }
          hl.Pmenu = { bg = ufc.popover, fg = c.fg }
          hl.PmenuSel = { bg = ufc.selected, bold = true }
          hl.NormalFloat = { bg = ufc.popover, fg = c.fg }
          hl.FloatBorder = { bg = ufc.popover, fg = ufc.input }
          hl.FloatTitle = { bg = ufc.popover, fg = ufc.green, bold = true }
          hl.MatchParen = { fg = ufc.green_bright, bold = true, underline = true }
          hl.IncSearch = { bg = ufc.ufc_red, fg = ufc.fg_bright }
          hl.CurSearch = { bg = ufc.ufc_red, fg = ufc.fg_bright }
          hl.SnacksDashboardHeader = { fg = ufc.ufc_red }
          hl.UfcDashboardRed = { fg = ufc.ufc_red, bold = true }
          hl.UfcDashboardGreen = { fg = ufc.green, bold = true }
          hl.SnacksDashboardKey = { fg = ufc.green }
          hl.SnacksDashboardIcon = { fg = ufc.green }
          hl.SnacksIndentScope = { fg = ufc.green }
          hl.SnacksPickerBorder = { bg = ufc.popover, fg = ufc.input }
          hl.SnacksPickerTitle = { bg = ufc.popover, fg = ufc.green, bold = true }
          hl.SnacksPickerMatch = { fg = ufc.green_bright, bold = true }
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "tokyonight" },
  },
  {
    -- green accent for normal mode in the statusline
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local ok, theme = pcall(require, "lualine.themes.tokyonight")
      if ok then
        theme = vim.deepcopy(theme)
        theme.normal.a = { bg = ufc.green, fg = ufc.chrome, gui = "bold" }
        theme.normal.b = { bg = ufc.raised, fg = ufc.green }
        theme.normal.c = { bg = ufc.chrome, fg = ufc.muted }
        opts.options = opts.options or {}
        opts.options.theme = theme
      end
    end,
  },
}
