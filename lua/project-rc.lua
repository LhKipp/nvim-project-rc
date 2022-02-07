local v = vim
local M = {}
local log = require('project-rc.log')

local function defaultConfig()
    return {
        config_file_name = ".nvimrc.lua",
        projects = { -- The projects for which sourcing a local config file is allowed
            -- "/home/user/repos/my_project"
        } 
    }
end

function M.onDirChanged()
    log.info("DirChanged, checking whether to load local config file")
    local curDir = vim.fn.getcwd()

    for _, projectPattern in ipairs(M.options.projects) do
        -- TODO allow pattern?
        if curDir == projectPattern then
            local localConfigFile = curDir .. "/" .. M.options.config_file_name
            if v.fn.filereadable(localConfigFile) then
                log.info("Sourcing local config file: " .. localConfigFile)
                v.cmd("source "..localConfigFile)
            end
            -- TODO in case of directory, add it to rtp?
        end
    end
end

function M.setup(options)
    M.options = v.tbl_extend("keep", options, defaultConfig())

    v.cmd([[
        " augroup project_rc
            " autocmd!
            au DirChanged * lua require('project-rc').onDirChanged()
        " augroup END
    ]])
    M.onDirChanged() -- Call once for initial start cwd, which is not transmitted by autocmd
end

return M
