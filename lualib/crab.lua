local lcrab = require 'lcrab'
local M = {}

local function _toutf8(line) 
    local words = {}
    for _, c in utf8.codes(line) do
        table.insert(words, c)
    end
    return words
end

function M.init(path)
    if not path then
        return
    end
    local words = {}
    for line in io.lines(path) do
        local t = _toutf8(line)
        table.insert(words, t)
    end
    lcrab.open(words)
end

function M.is_crabbed(str)
    if not str then 
        return true 
    end

    local t = _toutf8(str)
    return not lcrab.filter(t)
end

return M
