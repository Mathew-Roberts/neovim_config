return {
	{
		"nvim-neotest/nvim-nio",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<leader>dc", dap.continue, {})
			vim.keymap.set("n", "<leader>dt", dap.terminate, {})
			vim.keymap.set("n", "<leader>drt", dap.restart, {})
			vim.keymap.set("n", "<leader>dn", dap.step_over, {})
			vim.keymap.set("n", "<leader>dup", dap.up, {})
			vim.keymap.set("n", "<leader>ddn", dap.down, {})
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)

			local dap_python = require("dap-python")
			dap_python.test_runner = "pytest"

			vim.keymap.set("n", "<leader><C-r>", dap_python.test_method)
		end,
	},
}
