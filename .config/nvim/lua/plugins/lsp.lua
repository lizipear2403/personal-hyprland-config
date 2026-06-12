return {
  -- 语言服务器安装器
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- 自动配置 Mason 安装的 LSP 服务器
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",   -- Lua（Neovim 配置本身也需要）
          -- 按需添加，例如：
          "pyright",    -- Python
          "ts_ls",      -- TypeScript/JavaScript
          -- "gopls",      -- Go
          "rust_analyzer", -- Rust
        },
        automatic_installation = true,
      })
    end,
  },
  -- LSP 配置框架
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- 注入 nvim-cmp 的 capabilities，使 LSP 与补全引擎联动
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 使用 Neovim 0.11+ 原生 API 配置 LSP
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- 启用 LSP 服务器（仅启用已在 ensure_installed 中安装的）
      vim.lsp.enable("lua_ls")
      -- vim.lsp.enable({ "pyright", "gopls" })  -- 按需添加

      -- LSP 附加到 buffer 时的快捷键
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if not client then return end

          -- 启用原生 LSP 补全
          if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
          end

          -- 快捷键
          local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
          end
          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gr", vim.lsp.buf.references, "Go to references")
          map("n", "K", vim.lsp.buf.hover, "Hover documentation")
          map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        end,
      })
    end,
  },
}
