-- Sets tab width to 4 spaces for this buffer
vim.bo.tabstop = 4

-- Safely require jdtls; if it's not installed, stop execution to prevent errors
if not pcall(require, "jdtls") then
	return
end

-- Find the root directory of the project by looking for build or version control markers.
-- Including 'pom.xml' allows the LSP to correctly recognize and index Maven projects.
local root_dir = require("jdtls.setup").find_root({ "pom.xml", ".git", "mvnw", "gradlew" })

-- Extract the current project's directory name to use as a unique identifier
local project_name = vim.fn.fnamemodify(root_dir or vim.uv.cwd(), ":t")

-- Define a unique workspace directory for this project inside Neovim's global cache.
-- This keeps project caches isolated and prevents data corruption between different codebases.
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name

-- Localiza os .jar dos bundles de debug/test instalados pelo mason.
-- Sem isso, o jdtls sobe normalmente (LSP funciona) mas o debug (DAP) fica indisponível.
local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
local bundles = {}

vim.list_extend(
	bundles,
	vim.split(
		vim.fn.glob(mason_packages .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
		"\n"
	)
)
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_packages .. "/java-test/extension/server/*.jar"), "\n"))

-- Remove entradas vazias que o glob pode retornar quando os pacotes ainda não foram instalados
bundles = vim.tbl_filter(function(jar)
	return jar ~= ""
end, bundles)

local config = {
	-- Command options passed to launch the Eclipse JDT Language Server executable via Java
	cmd = {
		"java",
		-- Core Eclipse application and product IDs required to boot the headless LSP runtime
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",

		-- Enable communication logging between Neovim and the LSP for debugging purposes
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",

		-- Allocate 1 Gigabyte of initial memory RAM for the Java compiler/LSP process
		"-Xms1g",

		-- JVM modularity flags: grant access to system modules and open internal Java packages
		-- to ensure compatibility with modern JDK features and external build tools
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- Dynamically locate and execute the Eclipse Equinox launcher JAR file managed by Mason
		"-jar",
		vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),

		-- Set the configuration directory specific to the Linux operating system
		"-configuration",
		vim.fn.stdpath("data") .. "/mason/packages/jdtls/config_linux",

		-- Pass the isolated data/workspace path where the LSP will store indexes and metadata
		"-data",
		workspace_dir,
	},

	-- Tell the LSP where the root boundaries of the project are
	root_dir = root_dir,

	-- Envia os bundles de debug/test para dentro do jdtls
	init_options = {
		bundles = bundles,
	},

	-- Assim que o jdtls conecta ao buffer, habilita o DAP e gera automaticamente
	-- uma configuração de debug para cada classe com "main" encontrada no projeto.
	on_attach = function(_, bufnr)
		require("jdtls").setup_dap({ hotcodereplace = "auto" })
		require("jdtls.dap").setup_dap_main_class_configs()

		-- Keymaps específicos de Java (test runner do jdtls, via java-test)
		local opts = { buffer = bufnr, desc = "Debug nearest Java test" }
		vim.keymap.set("n", "<Leader>tn", require("jdtls").test_nearest_method, opts)
		vim.keymap.set(
			"n",
			"<Leader>tf",
			require("jdtls").test_class,
			{ buffer = bufnr, desc = "Debug Java test class" }
		)
	end,
}

-- Start the JDTLS client or attach it to the current buffer if it's already running.
-- See `:help vim.lsp.start_client` for more details.
require("jdtls").start_or_attach(config)
