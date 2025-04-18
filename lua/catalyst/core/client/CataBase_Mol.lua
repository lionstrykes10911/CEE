local Catalyst = Catalyst or {}
local hidden = false
local MOL = MOL
local parts = parts or {}


--theorised hide code (will be revised later, don't have a heart attack), should make it so we only throw a check when things actually change
--instead of doing iterated table checks
--[[
while self:isValid() do
  if self.hidden ~= Catalyst:isHidden(self or parent) then --simply check if the hidden state has changed or not for itself
    if not Catalyst:isHidden(self or parent) then --getting the actual hide state (will add function later)
        self.hidden = false
        table.insert(parts, self)
    else
        self.hidden = true
        table.insert(parts, PInd)
    end
  end
end
]]--
