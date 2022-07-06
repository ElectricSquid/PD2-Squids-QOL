tools = {}

function tools.fileExists(dir, filename)
    -- Possibly add a GetDirectories and loop through that too for extra recursion
    if not (file.DirectoryExists(dir)) then return false end

    list = file.GetFiles(dir)
    for i = 0, table.maxn(list) do
        -- Test for nil (directories) and skip
        if (list[i] == nil) then goto continue end

        if (list[i] == filename) then
            -- log("[SquidTrainer] Found " .. filename .. " in " .. dir)
            return true
        end

        ::continue::
    end

    return false
end
