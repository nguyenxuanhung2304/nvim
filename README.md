<center>
    <a href="https://github.com/nguyenxuanhung2304/nvim/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/nguyenxuanhung2304/nvim?style=for-the-badge&logo=starship&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41"/>
    </a>
    <a href="https://github.com/nguyenxuanhung2304/nvim/blob/main/LICENSE">
      <img alt="License" src="https://img.shields.io/github/license/nguyenxuanhung2304/nvim?style=for-the-badge&logo=starship&color=ee999f&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/nguyenxuanhung2304/nvim/stargazers">
      <img alt="Stars" src="https://img.shields.io/github/stars/nguyenxuanhung2304/nvim?style=for-the-badge&logo=starship&color=c69ff5&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/nguyenxuanhung2304/nvim/issues">
      <img alt="Issues" src="https://img.shields.io/github/issues/nguyenxuanhung2304/nvim?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41" />
    </a>
</center>

My Neovim setup powered by 💤 lazy.nvim to make it easy to customize and extend your config. Rather than having to choose between starting from scratch or using a pre-made distro

<img src="./assets/alpha.png">
<img src="./assets/telescope.png">
<img src="./assets/main.png">
<img src="./assets/which-key.png">

## ✨ Features

- 🔥 Transform your Neovim into a full-fledged IDE
- 💤 Easily customize and extend your config with [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🚀 Blazingly fast
- 🧹 Sane default settings for options, autocmds, and keymaps
- 📦 Comes with a wealth of plugins pre-configured and ready to use

## ⚡️ Requirements

### 🚀 Need have:
- Neovim >= **0.10** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional)_**

### 🔥 Lsp
- sourcekit: `sourcekit`
- solargraph: `gem install --user-install solargraph`
- tsserver: `npm install -g typescript typescript-language-server`
- eslint: `npm i -g vscode-langservers-extracted`
- jsonls: `npm i -g vscode-langservers-extracted`
- emmet_ls: `npm install -g emmet-ls`
- vuels: `npm install -g vls`
- lua_ls: `brew install lua-language-server`
- tailwindcss: `npm install -g @tailwindcss/language-server`
 
### 🧹 Formatters
- rubocop: `gem install rubocop`
- swiftformat: `brew install swiftformat`
- prettier: `npm install --save-dev --save-exact prettier`
- styluad: `brew install stylua`
- html, css, eslint: `npm i -g vscode-langservers-extracted`

## 📂 File Structure

The files under config will be automatically loaded at the appropriate time,
so you don't need to require those files manually.

You can add your custom plugin specs under `lua/plugins/`. All files there
will be automatically loaded by [lazy.nvim](https://github.com/folke/lazy.nvim)

<pre>
~/.config/nvim
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── mappings.lua
│   │   ├── init.lua
│   │   └── options.lua
│   └── plugins
│       ├── spec1.lua
│       ├── **
│       └── spec2.lua
└── init.lua
</pre>
