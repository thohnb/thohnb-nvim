return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    event = "VeryLazy", -- added comma
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic", -- added comma
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
        require("barbecue").setup({});
    end -- added 'end' to close the config function
}
