local telescope = require("telescope")
local actions = require("telescope.actions")

local set_picker_via_screen = function ()
  local pickers = {
    live_grep = {
      layout_strategy = "vertical",
      layout_config = {
        prompt_position = "top",
        width = 0.87,
        height = 0.80,
        preview_cutoff = 1,
        mirror = true,
      },
    },
  }

  local handle = io.popen("xrandr --query | grep 'connected primary'")
  if (handle == nil) then
    return nil
  end
  local result = handle:read("*a")
  handle:close()

  local width, height = result:match("(%d+)x(%d+)")
  width = tonumber(width)
  height = tonumber(height)

  if (width < height) then
    return pickers
  else
    return nil
  end
end

telescope.setup({
  pickers = set_picker_via_screen(),
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Esc>"] = require("telescope.actions").close,
      },
    },
  },
})

local M = {}

M.telescope = {
  defaults = {
    mappings = {
      n = {
        ["C-k"] = require("telescope.actions").move_selection_previous,
        ["C-j"] = require("telescope.actions").move_selection_next,
        ["<Esc>"] = require("telescope.actions").close,
      },
    },
  }
}

return M
