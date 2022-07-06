-- Create settings if it does not exist
if not tools.fileExists(SavePath, filename) then
    -- log("[SquidTrainer] Initializing settings")
    settings:Init()
end