-- cache the ModPath because sometimes it will use the path of a different mod later on
local path = ModPath

-- Load our localization keys for our menu, and menu items.
Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_SquidTrainerMenu", function( loc )
	loc:load_localization_file( path .. "localization/qol_menu/en.txt")
end)

-- Setup our menu callbacks, load our saved data, and build the menu from our json file.
Hooks:Add( "MenuManagerInitialize", "MenuManagerInitialize_SquidTrainerMenu", function( menu_manager )
	-- ### Don't forget to add the variables to settings:Init()! ###

	-- Setup our callbacks as defined in our item callback keys, and perform our logic on the data retrieved.
	-- Main Menu (st_menu_main)
	MenuCallbackHandler.callback_toggle_noheat = function(self, item)
		settings.data.noheat = (item:value() == "on" and true or false)
		settings:Save()
		--log("Toggle is: " .. item:value())
	end

	MenuCallbackHandler.callback_button_cashToOffshore = function(self, item)
		-- Total = Spending Cash
		-- Total_Collected = Offshore

		function cashToOffshore()
			local amount = managers.money:total()
			managers.money:add_to_offshore(amount)
			managers.money:deduct_from_spending(amount)
			Squid.saveAndRefresh()
		end

		local menu_title = managers.localization:text('dialog_offshore_title')
		local menu_message = managers.localization:text('dialog_offshore_message')
		local menu_options = {
				[1] = {
						text = managers.localization:text('common_yes'),
						callback = cashToOffshore
				},
				[2] = {
						text = managers.localization:text('common_no'),
						is_cancel_button = true
				}
		}
		-- creates a new QuickMenu object and shows it immediately, but does not store it as a variable.
		QuickMenu:new(menu_title, menu_message, menu_options, true)
	end

    MenuCallbackHandler.callback_button_forceReady = function(self, item)
        dofile(path .. "keybinds/force_ready.lua")
	end

	MenuCallbackHandler.callback_button_forceObjectiveReminder = function(self, item)
        dofile(path .. "keybinds/force_objective_reminder.lua")
	end
	

	-- Load our previously saved data from our save file.
	settings:Load()

	--[[
		Load our menu json file and pass it to our MenuHelper so that it can build our in-game menu for us.
		We pass our parent mod table as the second argument so that any keybind functions can be found and called
			as necessary.
		We also pass our data table as the third argument so that our saved values can be loaded from it.
	]]
	MenuHelper:LoadFromJsonFile( path .. "menus/menu_main.json", nil, settings.data )
end )
