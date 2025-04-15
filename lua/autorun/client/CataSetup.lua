Catalyst = Catalyst or {}

include("catalyst/core/client/CataEditor.lua")

concommand.Add("cee_editor", function(args)
	if Editor ~= nil then
		Editor:Remove()
		Editor = nil
	end
	Catalyst:openEditor()
end)

local icon = "icon64/CEEIcon_temp.png" or "icon64/playermodel.png"

list.Set( "DesktopWindows", "Catalyst",
		{
			title = "Catalyst",
			icon = icon,
			init = function( icon, window )
			window:Remove()
			RunConsoleCommand("cee_editor")
			end
		}

)
