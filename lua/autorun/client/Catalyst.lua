Catalyst = Catalyst
CEEditor = CEEditor or {}

function CEEditor:openEditor()
	Editor = vgui.Create( "DFrame" )
	Editor:SetTitle("Parts")
	Editor:SetPopupStayAtBack( true )
	Editor:SetSize(surface.ScreenWidth(), surface.ScreenHeight())
	Editor:SetScreenLock( true )
	Editor:ShowCloseButton( false )
	Editor.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 34, 97, 250 ) ) 
	end
	Editor:MakePopup()
	Editor:MoveToBack()
	Editor.EditorAttributes = vgui.Create( "DFrame" )
	Editor.EditorAttributes:SetTitle( "Attributes" )
	Editor.EditorAttributes:SetSize(200, surface.ScreenHeight()/2.25)
	Editor.EditorAttributes:SetMinimumSize( 100, 10)
	Editor.EditorAttributes:SetSizable( true )
	Editor.EditorAttributes:AlignRight()
	Editor.EditorAttributes:AlignBottom()
	Editor.EditorAttributes:SetScreenLock( true )
	Editor.EditorAttributes:ShowCloseButton( false )
	Editor.EditorAttributes:MakePopup()
	Editor.EditorAttributes.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 34, 97, 150 ) ) 
	end
	Editor.EditorAttributes:MoveToFront()
	Editor.CloseButton = vgui.Create( "DButton" )
	Editor.CloseButton:SetText("X")
	Editor.CloseButton.Paint = function(self, w, h) derma.SkinHook("Paint", "WindowCloseButton", self, w, h) end
	Editor.CloseButton:SetSize(31, 26)
	Editor.CloseButton:SetPos(surface.ScreenWidth() - Editor.CloseButton:GetWide() + 4, -2)
	Editor.CloseButton.DoClick = function()
		Editor:Remove()
		Editor.EditorAttributes:Remove()
		Editor.CloseButton:Remove()
		Editor = nil
	end
	Editor.CloseButton:MakePopup()
	Editor.CloseButton:MoveToFront()
end

concommand.Add("cee_editor", function(args)
	if Editor ~= nil then
		Editor:Remove()
		Editor.EditorAttributes:Remove()
		Editor.CloseButton:Remove()
		Editor = nil
	end
	CEEditor:openEditor()
end)

local icon = "icon64/CEEIcon_temp.png" or "icon64/playermodel.png"

list.Set( "DesktopWindows", "CEEditor",
		{
			title = "Catalyst E. Editor",
			icon = icon,
			init = function( icon, window )
			window:Remove()
			RunConsoleCommand("cee_editor")
			end
		}

)
