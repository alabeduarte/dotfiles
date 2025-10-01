return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      if opts.ensure_installed == nil then
        opts.ensure_installed = {}
      end
      vim.list_extend(opts.ensure_installed, { "stylua" })
    end,
  },
}
