tools = {}

function tools.fileExists(dir, filename)
    -- Possibly add a GetDirectories and loop through that too for extra recursion
    if not (file.DirectoryExists(dir)) then return false end

    list = file.GetFiles(dir)
    for i = 0, table.maxn(list) do
        -- Test for nil (directories) and skip
        if (list[i] == nil) then goto continue end

        if (list[i] == filename) then
            return true
        end

        ::continue::
    end

    return false
end

function tools.inTable(element, table)
    for key, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end