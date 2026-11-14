-- Landing page title: "UFCVIM" (UFC in UFC red, VIM in green)

-- stylua: ignore
local ufc = {
  [[██╗   ██╗███████╗ ██████╗]],
  [[██║   ██║██╔════╝██╔════╝]],
  [[██║   ██║█████╗  ██║     ]],
  [[██║   ██║██╔══╝  ██║     ]],
  [[╚██████╔╝██║     ╚██████╗]],
  [[ ╚═════╝ ╚═╝      ╚═════╝]],
}

-- small VIM, bottom-aligned next to UFC (blank rows keep every line the same width)
-- stylua: ignore
local vim_txt = {
  [[           ]],
  [[           ]],
  [[           ]],
  [[█ █ █ █▀▄▀█]],
  [[▀▄▀ █ █   █]],
  [[           ]],
}

-- Build a two-tone header: a newline at the end of each VIM chunk starts the next row.
local function header()
  local chunks = {}
  for i = 1, #ufc do
    chunks[#chunks + 1] = { ufc[i] .. " ", hl = "UfcDashboardRed" }
    chunks[#chunks + 1] = { vim_txt[i] .. (i < #ufc and "\n" or ""), hl = "UfcDashboardGreen" }
  end
  return chunks
end

return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.sections = {
        { header = header(), padding = 2 },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      }
    end,
  },
}
