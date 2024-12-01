Catalyst = Catalyst

print("Catalyst Loaded")

local icon = "icon64/CEEIcon_temp.png"

list.Set( "DesktopWindows", "CEEditor",
		{
			title = "Catalyst E. Editor",
			icon = icon,
			init = function( icon, window )
			window:Remove()
			RunConsoleCommand("cee_open")
			end
		}

)