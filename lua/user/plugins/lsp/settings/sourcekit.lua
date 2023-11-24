local util = require 'lspconfig.util'

return {
  root_dir = util.root_pattern('Package.swift', 'buildServer.json', 'compile_commands.json', '.git', 'app.swift')
}
