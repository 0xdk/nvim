-- lua/plugins/dap.lua
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio", -- required by dap-ui
			"rcarriga/nvim-dap-ui", -- debugger UI
			"theHamsta/nvim-dap-virtual-text", -- inline variable values
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim", -- install adapters via Mason
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Install js-debug adapter with Mason
			require("mason-nvim-dap").setup({
				ensure_installed = { "js-debug-adapter" },
				automatic_installation = true,
			})

			-- UI + inline values
			require("nvim-dap-virtual-text").setup({})
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_open"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_close"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_close"] = function()
				dapui.close()
			end

			-- Adapter: js-debug (pwa-node) from Mason
			local mason = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"
			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = { mason .. "/js-debug/src/dapDebugServer.js", "${port}" },
				},
			}

			-- Common bits
			local common = {
				type = "pwa-node",
				cwd = "${workspaceFolder}",
			}

			-- JavaScript configs (Node)
			dap.configurations.javascript = {
				-- Launch current file (quick script)
				vim.tbl_extend("force", common, {
					request = "launch",
					name = "Node: Launch current file",
					program = "${file}",
					console = "integratedTerminal",
				}),

				-- Attach to a running Node process (started with --inspect)
				vim.tbl_extend("force", common, {
					request = "attach",
					name = "Node: Attach to process (pick)",
					processId = require("dap.utils").pick_process,
				}),

				-- Attach by fixed port (default Node debug port 9229)
				vim.tbl_extend("force", common, {
					request = "attach",
					name = "Node: Attach via port 9229",
					port = 9229,
				}),

				-- Optional: Launch via nodemon (JS)
				-- Requires nodemon in PATH (global) or use npx nodemon and *attach* instead.
				vim.tbl_extend("force", common, {
					request = "launch",
					name = "Node: Launch via nodemon (JS)",
					runtimeExecutable = "nodemon",
					runtimeArgs = { "--inspect", "--watch", ".", "${file}" },
					restart = true,
					console = "integratedTerminal",
				}),

				-- Optional: Launch a compiled server from dist/
				vim.tbl_extend("force", common, {
					request = "launch",
					name = "Node: Launch dist/server.js",
					program = "${workspaceFolder}/dist/server.js",
					console = "integratedTerminal",
				}),
			}

			-- TypeScript configs (choose one workflow)
			-- Easiest: run TS with tsx or ts-node and attach
			dap.configurations.typescript = {
				-- TSX: run current file under watch + inspect
				vim.tbl_extend("force", common, {
					request = "launch",
					name = "TS: tsx watch file",
					runtimeExecutable = "tsx",
					runtimeArgs = { "watch", "--inspect", "${file}" },
					sourceMaps = true,
					console = "integratedTerminal",
				}),

				-- ts-node (ESM). If you use CommonJS, change to "-r", "ts-node/register" instead.
				vim.tbl_extend("force", common, {
					request = "launch",
					name = "TS: ts-node (ESM) current file",
					runtimeExecutable = "node",
					runtimeArgs = { "--loader", "ts-node/esm", "--inspect", "${file}" },
					program = "${file}",
					sourceMaps = true,
					console = "integratedTerminal",
				}),

				-- Attach variants for TS servers started with --inspect
				vim.tbl_extend("force", common, {
					request = "attach",
					name = "TS: Attach to process (pick)",
					processId = require("dap.utils").pick_process,
				}),
				vim.tbl_extend("force", common, {
					request = "attach",
					name = "TS: Attach via port 9229",
					port = 9229,
				}),
			}

			-- Keymaps
			local map = vim.keymap.set
			map("n", "<leader>dc", dap.continue, { desc = "DAP Continue" })
			map("n", "<leader>do", dap.step_over, { desc = "DAP Step Over" })
			map("n", "<leader>di", dap.step_into, { desc = "DAP Step Into" })
			map("n", "<leader>dO", dap.step_out, { desc = "DAP Step Out" })
			map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
			map("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Condition: "))
			end, { desc = "DAP Conditional Breakpoint" })
			map("n", "<leader>du", dapui.toggle, { desc = "DAP UI" })
			map("n", "<leader>dr", dap.repl.open, { desc = "DAP REPL" })
		end,
	},
}
