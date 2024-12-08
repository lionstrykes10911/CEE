Catalyst = Catalyst or {}
CEEditor = {}

function CEEditor:openEditor()
	self = vgui.Create( "DFrame" )
	self:SetTitle("Parts")
	self:SetPopupStayAtBack( true )
	self:SetSize(surface.ScreenWidth(), surface.ScreenHeight())
	self:SetScreenLock( true )
	self:ShowCloseButton( false )
	self.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 34, 97, 250 ) ) 
	end
	self.EditorAttributes = vgui.Create( "DFrame" )
	self.EditorAttributes:SetTitle( "Attributes" )
	self.EditorAttributes:SetSize(200, surface.ScreenHeight()/2.25)
	self.EditorAttributes:SetMinimumSize( 100, 10)
	self.EditorAttributes:SetSizable( true )
	self.EditorAttributes:AlignRight()
	self.EditorAttributes:AlignBottom()
	self.EditorAttributes:SetScreenLock( true )
	self.EditorAttributes:ShowCloseButton( false )
	self.EditorAttributes.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 34, 97, 150 ) ) 
	end
	self.CloseButton = vgui.Create( "DButton" )
	self.CloseButton:SetText("X")
	self.CloseButton.DoClick = function() self:Remove() end
	self.CloseButton.Paint = function(self, w, h) derma.SkinHook("Paint", "WindowCloseButton", self, w, h) end
	self.CloseButton:SetSize(31, 26)
	self.CloseButton:SetPos(surface.ScreenWidth() - self.CloseButton:GetWide() + 4, -4)
	RegisterDermaMenuForClose( CEEditor )
end

concommand.Add("cee_open", function(args)
	CEEditor.openEditor()
end)

local icon = "icon64/CEEIcon_temp.png" or "icon64/playermodel.png"

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
