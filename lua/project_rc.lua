local M = {}

local function with_defaults(options)
   return {
      name = options.name or "example"
   }
end

function M.setup(options)
   M.options = with_defaults(options)
end

return M
