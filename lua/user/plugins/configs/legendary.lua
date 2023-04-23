require("legendary").setup {
  keymaps = {
    -- Telescope
    { '<leader>ff', ':Telescope find_files', description = 'Files' },
    { "<cmd>Telescope buffers<cr>", description = "Buffers" },
    { "<cmd>Telescope project<cr>", description = "Projects" },
    { "<cmd>Telescope colorscheme<cr>", description = "Colorschemes" },
    { "<cmd>Telescope oldfiles<cr>", description = "Recent files" },
    {"<cmd>Telescope git_branches<cr>", description = "Git: branches"},
    {"<cmd>Telescope git_status<cr>", description = "Git: files changed"},
    {"<cmd>Telescope git_commits<cr>", description = "Git: Commits"},
    {"<cmd>Telescope git_stash<cr>", description = "Git: Stash"},

    { "<leader>c", "<cmd>Bdelete!<CR>", description =  "Close Buffer" },

    { "<cmd>nohlsearch<CR>", description = "No Highlight" },

    { "<cmd>Gtabedit:<cr>", description = "Open fugitive in new tab" },

    { "<cmd>Spectre<cr>", description = "Search or replace"},

    { "<cmd>Lazy<cr>", description = "Open plugin manager" },

    -- GitConflict
    {"<cmd>GitConflictChooseOurs<cr>", description = "GitConflict: Select current"},
    {"<cmd>GitConflictChooseTheirs<cr>", description = "GitConflict: Select incomming"},
    {"<cmd>GitConflictChooseBoth<cr>", description = "GitConflict: Select both"},
    {"<cmd>GitConflictChooseNone<cr>", description = "Select none of the changes"},
    {"<cmd>GitConflictNextConflict<cr>", description = "GitConflict: Next"},
    {"<cmd>GitConflictPrevConflict<cr>", description = "GitConflict: Previous"},
    {"<cmd>GitConflictListQf<cr>", description = "GitConflict: Send to qf"},

    -- GitSign
    { "<cmd>Gitsigns preview_hunk<cr>", description = "GitSigns: Preview" },
    { "<cmd>Gitsigns stage_hunk<cr>", description = "GitSigns: Stage"},
    { "<cmd>Gitsigns reset_hunk<cr>", description = "GitSigns: Unstage" },

    -- Search and repalce
    { "<cmd>SearchReplaceSingleBufferCWord<cr>", description = "Replace: In file" },
    { "<cmd>SearchReplaceMultiBufferCWord<cr>", description = "Replace: In project" },
  }
}

