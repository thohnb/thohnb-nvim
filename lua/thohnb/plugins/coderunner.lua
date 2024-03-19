return {
    "CRAG666/code_runner.nvim",
    config = function()
        -- Config
        require("code_runner").setup({
            filetype = {
                -- Config C++ , Python....
                cpp = "cd $dir && dir g++ filename -o $fileNameWithoutExt && $dir/$filenameWithoutExt"
            },
        })
    end
}
