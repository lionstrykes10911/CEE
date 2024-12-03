Catalyst = Catalyst or {}

local function openEditor()
	local CEEScreenSpace = vgui.Create( "DFrame" )
	CEEScreenSpace:SetTitle(" ")
	CEEScreenSpace:SetPopupStayAtBack( true )
	CEEScreenSpace:MakePopup()
	CEEScreenSpace:SetSize(40, 25)
	CEEScreenSpace:SetPos(surface.ScreenWidth()/1.02, 0)
	CEEScreenSpace:SetScreenLock( true )
	CEEScreenSpace:SetBackgroundBlur( false )
	CEEScreenSpace.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 131, 131, 131, 225) )
	end
	local EditorFrame = vgui.Create( "DFrame" )
	EditorFrame:SetTitle( "Catalyst Entity Editor" )
	EditorFrame:SetParent( CEEScreenSpace )
	EditorFrame:SetMinimumSize( 200, surface.ScreenHeight() )
	EditorFrame:SetSizable( true )
	EditorFrame:SetMinWidth(200)
	EditorFrame:SetScreenLock( true )
	EditorFrame:MakePopup()
	EditorFrame:ShowCloseButton( false )
	EditorFrame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 131, 131, 131, 225) )
	end
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