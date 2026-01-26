local jdtls = require("jdtls")

local root_dir = require("jdtls.setup").find_root({
	"pom.xml",
	"build.gradle",
	".git",
})

if not root_dir then
	return
end

local config = {
	cmd = { "jdtls" },
	root_dir = root_dir,
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = "/usr/lib/jvm/java-21-openjdk-amd64",
					},
				},
			},
		},
	},
}

jdtls.start_or_attach(config)
