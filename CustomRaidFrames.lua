hooksecurefunc("CompactRaidGroup_UpdateLayout", function(self)
  -- Use this only when in a raid group.
  if UnitInParty("player") or UnitInRaid("player") or UnitInBattleground("player") then
    -- Always hide group name
    self.title:Hide()
    local totalHeight = self.title:GetHeight();
    local totalWidth = 0;
    if ( CUF_HORIZONTAL_GROUPS ) then
      self.title:ClearAllPoints();
      self.title:SetPoint("TOPLEFT");
  
      local self1 = _G[self:GetName().."Member1"];
      self1:ClearAllPoints();
      self1:SetPoint("TOPLEFT", self, "TOPLEFT", 0, -self.title:GetHeight());
  
      for i=2, MEMBERS_PER_RAID_GROUP do
        local unitFrame = _G[self:GetName().."Member"..i];
        unitFrame:ClearAllPoints();
        unitFrame:SetPoint("LEFT", _G[self:GetName().."Member"..(i-1)], "RIGHT", 0, 0);
      end
      totalHeight = totalHeight + _G[self:GetName().."Member1"]:GetHeight();
      totalWidth = totalWidth + _G[self:GetName().."Member1"]:GetWidth() * MEMBERS_PER_RAID_GROUP;
      -- Squeeze groups together by removing space used by (now hidden) group number.
      self:SetSize(totalWidth, totalHeight - 14);
    end
  end
end)

hooksecurefunc("DefaultCompactUnitFrameSetup", function(f)
  for _,d in ipairs(f.debuffFrames) do
    d.baseSize = 15 
  end
  for _,d in ipairs(f.buffFrames) do
    d:SetSize(15, 15)
  end
end)
