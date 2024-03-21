return {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
      }
    end
  }