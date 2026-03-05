local TerminalToggle = {}

-- Store the terminal buffer ID
local terminal_buf = nil

-- Toggle function
function TerminalToggle.toggle(command)
	-- Check if terminal buffer exists and is valid
	if terminal_buf == nil or not vim.api.nvim_buf_is_valid(terminal_buf) then
		-- Create a new terminal buffer
		terminal_buf = vim.api.nvim_create_buf(false, true)

		-- Open the terminal in a split window
		vim.cmd("botright split")
		vim.api.nvim_win_set_buf(0, terminal_buf)
		vim.api.nvim_win_set_height(0, 10)

		local cmd_to_run = { "zsh" }
		if command then
			table.insert(cmd_to_run, command)
		end

		-- Start the terminal
		vim.fn.termopen(cmd_to_run) -- TODO: this is deprecated, switch to vim.apt.nvim_open_term

		-- Automatically enter terminal mode
		vim.cmd("startinsert")
	else
		-- Check if the terminal buffer is already displayed in a window
		local term_win = vim.fn.bufwinid(terminal_buf)
		if term_win == -1 then
			-- Terminal is not displayed, open it
			vim.cmd("botright split")
			vim.api.nvim_win_set_buf(0, terminal_buf)
			vim.api.nvim_win_set_height(0, 10)
			vim.cmd("startinsert")
		else
			-- Terminal is already displayed, close the window
			vim.api.nvim_win_close(term_win, false)
		end
	end
end

-- Map :TerminalToggle command to the toggle function
vim.api.nvim_create_user_command("TerminalToggle", TerminalToggle.toggle, { nargs = 0 })

-- Bind a terminal-mode key to toggle the terminal
vim.keymap.set({ "t", "n", "i" }, "<C-q>", function()
	TerminalToggle.toggle()
end, { noremap = true, silent = true })

vim.keymap.set({ "t" }, "<ESC><ESC>", "<c-\\><c-n><c-w>W", { noremap = true, silent = true })

return TerminalToggle
