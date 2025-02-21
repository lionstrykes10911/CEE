local Catalyst = Catalyst or {}
local CataEditor = CataEditor

function SpawnCam()
    hook.Add("CalcView", "CEECam", function(ply, origin, angles, fov, znear, zfar)
        local cam = {
            origin = LocalPlayer():GetShootPos() + (Vector(angles:Forward().x * 100, angles:Forward().y * 100, 0)),
            angles = Angle(0, LocalPlayer():EyeAngles().y, 0) + Angle(0, 180, 0),
            fov = fov,
            drawviewer = true
        }
    
        return cam
    end)
end
