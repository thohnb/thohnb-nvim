-- Local Variable --
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
--
require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<Down>'] = { c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }) },
        ['<Up>'] = { c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }) },
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        
        { name = "nvim_lsp",max_item_count = 10},
        { name = "luasnip",max_item_count = 10 }, -- snippets
        { name = "buffer",max_item_count = 10 }, -- text within current buffer
        { name = "path",max_item_count = 10}, -- file system paths
        { name = "git"}, -- Git
        { name = "nvim_lsp_signature_help", priority_weight = 500 },
      }),
      
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "async_path" },
    { name = "cmdline" },
    { name = "buffer" },
  }),
  enabled = function()
    local disabled = {
      IncRename = true,
    }
    local cmd = vim.fn.getcmdline():match("%S+")
    return not disabled[cmd] or cmp.close()
  end,
})

