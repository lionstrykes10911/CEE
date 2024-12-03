Catalyst = Catalyst or {}

local function openEditor()
	local CEEScreenSpace = vgui.Create( "DFrame" )
	CEEScreenSpace:SetTitle("")
	CEEScreenSpace:SetPopupStayAtBack( true )
	CEEScreenSpace:MakePopup()
	CEEScreenSpace:SetSize(35, 20)
	CEEScreenSpace:AlignRight(-7)
	CEEScreenSpace:ShowCloseButton(true)
	CEEScreenSpace:SetBackgroundBlur( false )
	local EditorFrame = vgui.Create( "DFrame" )
	EditorFrame:SetTitle("")
	EditorFrame:SetParent( CEEScreenSpace )
	EditorFrame:SetMinimumSize( 240, surface.ScreenHeight() )
	EditorFrame:SetSizable( true )
	EditorFrame:SetMinWidth(240)
	EditorFrame:SetScreenLock( true )
	EditorFrame:MakePopup()
	EditorFrame:ShowCloseButton( false )
	EditorFrame:SetPaintBorderEnabled( true )
end

local function CatalystCheck() 
	openEditor()
end

concommand.Add("cee_close", function(args)
	closeEditor()
end)

concommand.Add("cee_open", function(args)
	CatalystCheck()
end)

local icon = "icon64/CEEIcon_temp.png"
icon = file.Exists("materials/"..icon,'GAME') and icon or "icon64/playermodel.png"

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