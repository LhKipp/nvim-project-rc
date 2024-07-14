# nvim-project-rc - Yet another project configuration plugin 

> [!NOTE]
> This plugin is discontinued in favour of nvims 0.9 undeprecated `exrc` option.

While loading of directory local configuration files is possible via the `exrc` option, it does not allow to do so only for whitelisted directories. Any `.exrc` file will be sourced. Thats a security concern.

This plugin loads `.exrc` files, if the current working directory (cwd) contains one and the cwd is whitelisted.

## Installation

```vim
Plug 'LhKipp/nvim-project-rc'
```

Don't forget to call setup :smirk:
```lua
require('project-rc').setup{}
```

## Configuration
(Default values are shown)
```lua
require('project-rc').setup{
    config_file_name = ".nvimrc.lua", -- Note it is not ".exrc" or ".nvimrc" by default
    projects = { -- The directories in which sourcing a local config file is allowed
        -- "/home/user/repos/my_project"
    } 
}
```
