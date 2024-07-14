local M = {}

function M.setup(options)
    error(
        "Hi there, looks like you are using nvim-project-rc. This plugin is discontinued in favour of nvim 0.9 undeprecated exrc option (it's safe now - see `:h exrc'`). You can enable exrc via `vim.o.exrc = true` and remove this plugin.")
end

return M
