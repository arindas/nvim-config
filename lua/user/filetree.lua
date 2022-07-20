local setup_ok, nvim_tree_module = pcall(require, "nvim-tree")
if not setup_ok then
	return
end

nvim_tree_module.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = false,
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = false,
		update_cwd = false,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		mappings = {
			custom_only = false,
			list = {},
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	actions = {
		open_file = {
			quit_on_open = false,
			resize_window = true,
			window_picker = {
				exclude = {
					filetype = { "notify", "packer", "qf" },
					buftype = { "terminal" },
				},
			},
		},
	},
	renderer = {
		root_folder_modifier = table.concat({
			":t:gs?$?/..",
			string.rep(" ", 1000),
			"?:gs?^??",
		}),
		indent_markers = {
			enable = true,
		},
		add_trailing = false,
		highlight_opened_files = "none",
		icons = {
			show = {
				folder = true,
				file = true,
				git = true,
				folder_arrow = false,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					deleted = "",
					ignored = "◌",
					renamed = "➜",
					staged = "✓",
					unmerged = "",
					unstaged = "✗",
					untracked = "*",
				},
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
					symlink_open = "",
				},
			},
		},
	},
})
