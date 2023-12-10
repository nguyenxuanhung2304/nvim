return {
	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = "~/Dev/" .. project_name

		local opts = {
			-- The command that starts the language server
			-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
			cmd = {

				"/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home/bin/java",
				-- depends on if `java` is in your $PATH env variable and if it points to the right version.

				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",

				"-jar",
				"/Users/rightsvn-hung/jdt-language-server-1.9.0/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",

				"-configuration",
				"/Users/rightsvn-hung/jdt-language-server-1.9.0/config_mac",

				"-data",
				workspace_dir,
			},

			root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

			-- Here you can configure eclipse.jdt.ls specific settings
			-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
			-- for a list of options
			settings = {
				java = {},
			},

			-- Language server `initializationOptions`
			-- You need to extend the `bundles` with paths to jar files
			-- if you want to use additional eclipse.jdt.ls plugins.
			--
			-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
			--
			-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
			init_options = {
				bundles = {},
			},
		}

		require("jdtls").start_or_attach(opts)
	end,
}
