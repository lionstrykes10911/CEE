local Catalyst = Catalyst or {}
local hidden = false
local MOL = MOL
local parts = parts or {}


--theorised hide code (will be revised later, don't have a heart attack), should make it so we only throw a check when things actually change
--instead of doing iterated table checks
--[[
function Catalyst:isHidden(MOL)
    local MOL = MOL
    return MOL.hidden
end

while self:isValid() do
  if self.hidden ~= Catalyst:isHidden(self or parent) then
      self.hidden = false
      table.insert(parts, self)
  else
      self.hidden = true
      table.insert(parts, PInd)
  end
else
end
end
]]--
