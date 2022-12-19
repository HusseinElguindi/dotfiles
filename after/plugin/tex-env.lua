local ts = vim.treesitter
local ts_utils = require('nvim-treesitter.ts_utils')

local M = {}

local inTable = function(table, n)
    for _, val in pairs(table) do
        if val == n then 
            return true 
        end
    end
    return false
end


local mathEnv = {
    "displaymath", "displaymath*",
    "equation", "equation*",
    "multline", "multline*",
    "eqnarray", "eqnarray*",
    "align", "align*",
    "array", "array*",
    "split", "split*",
    "alignat", "alignat*",
    "gather", "gather*",
    "flalign", "flalign*",
}
local isMathEnvName = function(envName)
    return inTable(mathEnv, envName)
end

local nonMathCommands = {"\\text", "\\tag", "\\tag*"}
local isNonMathCommand = function(n)
    local t = n:type()
    if t == 'label_definition' then
        return true
    elseif t == 'generic_command' then
        for child, _ in n:iter_children() do
            if child:type() == 'generic_command_name' then
                local text = ts.get_node_text(child, 0)
                if inTable(nonMathCommands, text) then
                    return true
                end
            end
        end
    end
    return false
end

local isMathEnv = function()
    local node = ts_utils.get_node_at_cursor()

    while node do
        if isNonMathCommand(node) then
            return false
        elseif node:type() == 'math_environment' then
            return true
        elseif node:type() == 'environment' then
            for child, name in node:iter_children() do
                if child:type() == 'begin' and name == 'begin' then
                    for child2, name2 in child:iter_children() do
                        if child2:type() == 'word' and name2 == 'name' then
                            local text = ts.get_node_text(child2, 0)
                            if isMathEnvName(text) then
                                return true
                            end
                        end
                    end
                end
            end
        elseif node:type() == 'inline_formula' or node:type() == 'displayed_equation' then
            return true
        end

        node = node:parent()
    end
end

M.isMathEnv = function()
    if isMathEnv() then
        return 1
    else
        return 0
    end
end

function IsTexMathEnv()
    return M.isMathEnv()
end
