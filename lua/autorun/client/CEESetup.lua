Catalyst = Catalyst or {}

local function openEditor()
	local CEEScreenSpace = vgui.Create( "DFrame" )
	CEEScreenSpace:SetTitle("")
	CEEScreenSpace:SetPopupStayAtBack( true )
	CEEScreenSpace:SetSize(surface.ScreenWidth(), surface.ScreenHeight())
	CEEScreenSpace:SetScreenLock( true )
	CEEScreenSpace:ShowCloseButton(true)
	CEEScreenSpace.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 34, 97, 250 ) ) 
	end
local EditorExplorer = vgui.Create( "DFrame" )
	EditorExplorer:SetTitle( "Parts" )
	EditorExplorer:SetSizable( true )
	EditorExplorer:SetSize(200, surface.ScreenHeight())
	EditorExplorer:SetMinimumSize( 200, 200 )
	EditorExplorer:SetScreenLock( true )
	EditorExplorer:ShowCloseButton( false )
	EditorExplorer:SetParent(CEEScreenSpace)
	EditorExplorer.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 34, 97, 150 ) ) 
	end
local EditorAttributes = vgui.Create( "DFrame" )
	EditorAttributes:SetTitle( "Attributes" )
	EditorAttributes:SetSize(200, surface.ScreenHeight()/2.25)
	EditorAttributes:SetMinimumSize( 100, 10)
	EditorAttributes:SetSizable( true )
	EditorAttributes:AlignRight()
	EditorAttributes:AlignBottom()
	EditorAttributes:SetScreenLock( true )
	EditorAttributes:ShowCloseButton( false )
	EditorAttributes:SetParent(CEEScreenSpace)
	EditorAttributes.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 34, 97, 150 ) ) 
	end
	CEEScreenSpace:MakePopup()
end

local function closeEditor()

end

local function CatalystCheck() 
	openEditor()
end

concommand.Add("cee_toggle", function(args)
	CatalystCheck()
end)

local icon = "icon64/CEEIcon_temp.png"

list.Set( "DesktopWindows", "CEEditor",
		{
			title = "Catalyst E. Editor",
			icon = icon,
			init = function( icon, window )
			window:Remove()
			RunConsoleCommand("cee_toggle")
			end
		}

)
