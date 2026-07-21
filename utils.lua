local M = {}

M.merge = function(a, b)
    if type(a) == "table" and type(b) == "table" then
        for k, v in pairs(b) do
            if type(v) == "table" and type(a[k] or false) == "table" then
                M.merge(a[k], v)
            else
                a[k] = v
            end
        end
    end
end

M.contains_key = function(k, t)
    if type(t) ~= "table" then
        return false
    end
    for a, _ in pairs(t) do
        if k == a then
            return true
        end
    end
    return false
end

return M
