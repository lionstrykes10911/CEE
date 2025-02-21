local Catalyst = Catalyst or {}
local CataEditor = CataEditor
local InEditor = InEditor

include("catalyst/core/client/CataCam.lua")

function Catalyst:openEditor()
	SpawnCam()
	Editor = vgui.Create( "DFrame" )
	surface.PlaySound("CEEOpen_Temp.wav")
	Editor:SetTitle("Parts")
	Editor:SetPopupStayAtBack( true )
	Editor:SetMinimumSize( 200, surface.ScreenHeight())
	Editor:SetSize(250, surface.ScreenHeight())
	Editor:SetScreenLock( true )
	Editor:SetSizable( true )
	Editor:ShowCloseButton( false )
	Editor.Paint = function( self, w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 34, 97, 150) ) 
	end
	Editor:MakePopup()
	Editor:MoveToBack()
	Editor.EditorAttributes = vgui.Create( "DFrame" )
	Editor.EditorAttributes:SetTitle( "Attributes" )
	Editor.EditorAttributes:SetSize(200, surface.ScreenHeight()/2.25)
	Editor.EditorAttributes:SetMinimumSize( 200, 10)
	Editor.EditorAttributes:SetSizable( true )
	Editor.EditorAttributes:AlignRight()
	Editor.EditorAttributes:AlignBottom()
	Editor.EditorAttributes:SetScreenLock( true )
	Editor.EditorAttributes:ShowCloseButton( false )
	Editor.EditorAttributes:SetParent(Editor)
	Editor.EditorAttributes:MakePopup()
	Editor.EditorAttributes.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 34, 97, 150 ) ) 
	end
	Editor.EditorAttributes:MoveToFront()
	Editor.CloseButton = vgui.Create( "DImageButton" )
	Editor.CloseButton:SetImage( "materials/icon64/CEEClose.png",  nil )
	Editor.CloseButton:SetSize(64, 64)
	Editor.CloseButton:SetPos(surface.ScreenWidth() - Editor.CloseButton:GetWide() + 4, -2)
	Editor.CloseButton.DoClick = function()
		surface.PlaySound( "CEEClose_Temp.wav" )
		Editor:Remove()
		Editor = nil
		hook.Remove("CalcView", "CEECam")
	end
	Editor.CloseButton:SetParent(Editor)
	Editor.CloseButton:MakePopup()
	Editor.CloseButton:MoveToFront()
end