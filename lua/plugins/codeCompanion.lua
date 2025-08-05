return {
  {
    "olimorris/codecompanion.nvim",
    cmd = {
      "CodeCompanion",
      "CodeCompanionActions",
      "CodeCompanionChat",
      "CodeCompanionCmd",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "codecompanion" }
      },
    },
    opts = {
      adapters = {
        copilot = function()
          return require('codecompanion.adapters').extend('copilot', {
            schema = {
              model = {
                default = 'claude-3.7-sonnet',
              },
            },
          })
        end,
      },
      strategies = {
        chat = { adapter = "copilot" },
        inline = { adapter = "copilot" },
        agent = { adapter = "copilot" },
      },
    },
    keys = {
      { '<leader>cc', '<cmd>CodeCompanionChat<CR>',     mode = 'n', desc = 'Open CodeCompanion chat' },
      { '<leader>cs', '<cmd>CodeCompanionSelection<CR>', mode = 'v', desc = 'Send selection to CodeCompanion' },
      { '<leader>ce', '<cmd>CodeCompanionExplain<CR>',   mode = 'n', desc = 'Explain current buffer' },
      { '<leader>cr', '<cmd>CodeCompanionReview<CR>',    mode = 'v', desc = 'Review selected code' },
      { '<leader>ct', '<cmd>CodeCompanionTest<CR>',      mode = 'v', desc = 'Generate tests for selection' },
      { '<leader>cf', '<cmd>CodeCompanionFix<CR>',       mode = 'v', desc = 'Fix problems in selection' },
      { '<leader>cg', '<cmd>CodeCompanionGenerate<CR>',  mode = 'n', desc = 'Generate code inline' },
    },
  },
}
