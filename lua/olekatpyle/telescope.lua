local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = "   ",
		color_devicons = true,
		vimgrep_arguments = vimgrep_arguments,

		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown", -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		bookmarks = {
			selected_browser = "brave",
			url_open_command = "brave",
			url_open_plugin = nil,
			full_path = true,
			firefox_profile_name = "default-release",
			waterfox_profile_name = nil,
			buku_include_tags = false,
			debug = false,
			theme = "dropdown",
		},
		file_browser = {
			theme = "dropdown",
			hijack_netrw = true,
		},
	},
})

local M = {}

function M.reload_modules()
	local lua_dirs = vim.fn.glob("./lua/*", 0, 1)
	for _, dir in ipairs(lua_dirs) do
		dir = string.gsub(dir, "./lua/", "")
		require("plenary.reload").reload_module(dir)
	end
end

M.search_nvim = function()
	require("telescope.builtin").find_files({
		prompt_title = "< .config/nvim >",
		cwd = vim.env.NVIM_DIR,
		hidden = true,
	})
end

M.search_qtile = function()
	require("telescope.builtin").find_files({
		prompt_title = "< Qtile >",
		cwd = vim.env.QT_DIR,
		hidden = true,
	})
end

M.search_devops = function()
	require("telescope.builtin").find_files({
		prompt_title = "< DevOps >",
		cwd = vim.env.DEVOPS_DIR,
		hidden = true,
	})
end

M.search_config = function()
	require("telescope.builtin").find_files({
		prompt_title = "< Config >",
		cwd = vim.env.CONF_DIR,
		hidden = true,
	})
end

M.search_www = function()
	require("telescope.builtin").find_files({
		prompt_title = "< www >",
		cwd = vim.env.WWW_DIR,
		hidden = true,
	})
end

M.git_branches = function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end

require("telescope").load_extension("dap")
require("telescope").load_extension("bookmarks")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("file_browser")

return M
