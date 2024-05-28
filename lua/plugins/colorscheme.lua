-- Theme/Colorscheme (uncomment section for whichever theme you prefer or use your own)
-- Kanagawa Theme (Custom Palette)
return {
  {
    -- https://github.com/rebelot/kanagawa.nvim
    'rebelot/kanagawa.nvim', -- You can replace this with your favorite colorscheme
    lazy = false,          -- We want the colorscheme to load immediately when starting Neovim
    priority = 1000,       -- Load the colorscheme before other non-lazy-loaded plugins
    opts = {
      -- Replace this with your scheme-specific settings or remove to use the defaults
      -- transparent = true,
      background = {
        -- light = "lotus",
        dark = "wave", -- "wave, dragon"
      },
      colors = {
        palette = {
          -- Background colors
          sumiInk0 = "#161616", -- modified
          sumiInk1 = "#181818", -- modified
          sumiInk2 = "#1a1a1a", -- modified
          sumiInk3 = "#1F1F1F", -- modified
          sumiInk4 = "#2A2A2A", -- modified
          sumiInk5 = "#363636", -- modified
          sumiInk6 = "#545454", -- modified

          -- Popup and Floats
          waveBlue1 = "#322C47", -- modified
          waveBlue2 = "#4c4464", -- modified

          -- Diff and Git
          winterGreen = "#2B3328",
          winterYellow = "#49443C",
          winterRed = "#43242B",
          winterBlue = "#252535",
          autumnGreen = "#76A56A", -- modified
          autumnRed = "#C34043",
          autumnYellow = "#DCA561",

          -- Diag
          samuraiRed = "#E82424",
          roninYellow = "#FF9E3B",
          waveAqua1 = "#7E9CD8", -- modified
          dragonBlue = "#7FB4CA", -- modified

          -- Foreground and Comments
          oldWhite = "#C8C093",
          fujiWhite = "#F9E7C0", -- modified
          fujiGray = "#727169",
          oniViolet = "#BFA3E6", -- modified
          oniViolet2 = "#BCACDB", -- modified
          crystalBlue = "#8CABFF", -- modified
          springViolet1 = "#938AA9",
          springViolet2 = "#9CABCA",
          springBlue = "#7FC4EF", -- modified
          waveAqua2 = "#77BBDD", -- modified

          springGreen = "#98BB6C",
          boatYellow1 = "#938056",
          boatYellow2 = "#C0A36E",
          carpYellow = "#FFEE99", -- modified

          sakuraPink = "#D27E99",
          waveRed = "#E46876",
          peachRed = "#FF5D62",
          surimiOrange = "#FFAA44", -- modified
          katanaGray = "#717C7C",
        },
      },
    },
    config = function(_, opts)
      require('kanagawa').setup(opts) -- Replace this with your favorite colorscheme
      vim.cmd("colorscheme eldritch") -- Replace this with your favorite colorscheme

      -- Custom diff colors
      vim.cmd([[
      autocmd VimEnter * hi DiffAdd guifg=#00FF00 guibg=#005500
      autocmd VimEnter * hi DiffDelete guifg=#FF0000 guibg=#550000
      autocmd VimEnter * hi DiffChange guifg=#CCCCCC guibg=#555555
      autocmd VimEnter * hi DiffText guifg=#00FF00 guibg=#005500
    ]])

      -- Custom border colors
      vim.cmd([[
      autocmd ColorScheme * hi NormalFloat guifg=#F9E7C0 guibg=#1F1F1F
      autocmd ColorScheme * hi FloatBorder guifg=#F9E7C0 guibg=#1F1F1F
    ]])
    end
  },
  {
    "tanvirtin/monokai.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   require("catppuccin").setup({
    --     flavor = "mocha",
    --     transparent_background = is_transparent,
    --   })
    --   -- vim.cmd("colorscheme catppuccin")
    -- end,
  },
  {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   require("NeoSolarized").setup({
    --     theme = "light", -- dark or light
    --   })
    --   -- vim.cmd([[ colorscheme NeoSolarized ]])W
    -- end,
  },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    lazy = false,
    -- config = function()
    --   require("modus-themes").setup({})
    --   -- vim.cmd("colorscheme modus")
    -- end,
  },
  {
    "oxfist/night-owl.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   require("night-owl").setup({})
    --   -- vim.cmd([[ colorscheme night-owl ]])
    -- end,
  },
  {
    "christianchiarulli/nvcode-color-schemes.vim",
    lazy = false,
    priority = 1000,
  },
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}

-- Tokyo Night Theme
-- return {
--   -- https://github.com/folke/tokyonight.nvim
--   'folke/tokyonight.nvim', -- You can replace this with your favorite colorscheme
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--     -- Replace this with your scheme-specific settings or remove to use the defaults
--     -- transparent = true,
--     style = "night", -- other variations "storm, night, moon, day"
--   },
--   config = function(_, opts)
--     require('tokyonight').setup(opts) -- Replace this with your favorite colorscheme
--     vim.cmd("colorscheme tokyonight") -- Replace this with your favorite colorscheme
--   end
-- }

-- Catppuccin Theme
-- return {
--   -- https://github.com/catppuccin/nvim
--   'catppuccin/nvim',
--   name = "catppuccin", -- name is needed otherwise plugin shows up as "nvim" due to github URI
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--   --   -- Replace this with your scheme-specific settings or remove to use the defaults
--     -- transparent = true,
--     flavour = "mocha", -- "latte, frappe, macchiato, mocha"
--   },
--   config = function(_, opts)
--     require('catppuccin').setup(opts) -- Replace this with your favorite colorscheme
--     vim.cmd("colorscheme catppuccin") -- Replace this with your favorite colorscheme
--   end
-- }

-- Sonokai Theme
-- return {
--   -- https://github.com/sainnhe/sonokai
--   'sainnhe/sonokai',
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   config = function(_, opts)
--     vim.g.sonokai_style = "default" -- "default, atlantis, andromeda, shusia, maia, espresso"
--     vim.cmd("colorscheme sonokai") -- Replace this with your favorite colorscheme
--   end
-- }

-- One Nord Theme
-- return {
--   -- https://github.com/rmehri01/onenord.nvim
--   'rmehri01/onenord.nvim',
--   lazy = false, -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000, -- Load the colorscheme before other non-lazy-loaded plugins
--   config = function(_, opts)
--     vim.cmd("colorscheme onenord") -- Replace this with your favorite colorscheme
--   end
-- }
