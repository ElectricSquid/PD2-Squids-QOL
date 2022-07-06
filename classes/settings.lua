-- We setup the global table for our mod, along with some path variables, and a data table.
filename = "Squids_QOL_settings.json"
DataPath = SavePath .. filename

settings = {}
settings.data = {} 

-- A simple save function that json encodes our data table and saves it to a file.
function settings:Save()
	local file = io.open( DataPath, "w+" )
	if file then
		file:write( json.encode( self.data ) )
		file:close()
	end
end

-- A simple load function that decodes the saved json data table if it exists.
function settings:Load()
	local file = io.open( DataPath, "r" )
	if file then
		self.data = json.decode( file:read("*all") )
		file:close()
	end
end

-- Initialize settings file with default values
-- This is also where default values will be, mod_options menu will read these so it's defaults do not matter
function settings:Init()
	-- Main Menu
	settings.data.noheat = false

	settings:Save()
end
