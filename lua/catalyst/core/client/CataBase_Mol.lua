local Catalyst = Catalyst or {}
local hidden = false
local MOL = MOL


--theorised hide code, should make it so we only throw a check when things actually change
--instead of doing iterated table checks
--[[while self:isValid() do
  if self.hidden ~= MOL:isHidden(self) then
      self.hidden = false
  else
      self.hidden = true
  end
else
end
end
]]--
