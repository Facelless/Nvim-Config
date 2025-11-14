local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "ts_ls", "pyright" },
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = { "lua_ls", "gopls", "ts_ls", "pyright" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end
    end,
  },
  {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),

      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          menu = {
            buffer = "[BUF]",
            nvim_lsp = "[LSP]",
            luasnip = "[SNIP]",
            path = "[PATH]",
          },
        }),
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      experimental = {
        ghost_text = { hl_group = "Comment" },
      },
    })
  end,
},
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "go" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

{
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvim_tree = require("nvim-tree")

    nvim_tree.setup({
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
         group_empty = true,

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = true,
      },
    },

    indent_markers = {
      enable = true,
      icons = {
        corner = "●",
        edge = "│",
        item = "│",
        bottom = "●",
        none = " ",
      },
    },
      },
      filters = {
        dotfiles = false,
      },
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local stats = vim.loop.fs_stat(vim.fn.getcwd())
        if stats and stats.type == "directory" then
          require("nvim-tree.api").tree.open()
        end
      end,
    })
  end,
},
  {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,
      enable_check_bracket_line = true,
      map_cr = true,
      map_bs = true,
    })
  end,
  },
{
  "andweeb/presence.nvim",
  config = function()
  require("presence"):setup({
    auto_update         = true,
    neovim_image_text   = "The One True Text Editor",
    main_image          = "neovim_custom",
    client_id           = "1438686222318047333",
    log_level           = nil,
    debounce_timeout    = 10,
    enable_line_number  = false,
    editing_text        = "Editando essa porra %s",
    file_explorer_text  = "Vendo essa porra %s",
    git_commit_text     = "Fazendo commit nessa porra",
    plugin_manager_text = "Gerenciando plugin nessa porra",
    reading_text        = "Lendo essa porra aqui %s",
    workspace_text      = "Trabalhando na porra do %s",
    line_number_text    = "Line %s out of %s",      
  })

  end,
},




})
