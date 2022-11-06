return {
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'ruby', 'eruby' },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
    scss = {
      options = {
        ["bem.enabled"] = true,
      },
    },
    eruby = {
      options = {
        ["bem.enabled"] = true
      }
    }
  }
}
