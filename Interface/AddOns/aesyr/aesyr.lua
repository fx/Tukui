LoadAddOn('Tukui');
LoadAddOn('BigWigs');

MultiBarBottomLeft:SetScale(0.8);
MultiBarBottomRight:SetScale(0.8);
MainMenuBar:SetScale(0.8);

MainMenuBarLeftEndCap:SetTexture("Interface\\AddOns\\aesyr\\skull-left-small.tga");
MainMenuBarLeftEndCap:ClearAllPoints();
MainMenuBarLeftEndCap:SetPoint("RIGHT", MainMenuBar, "LEFT", 10, 33);
MainMenuBarLeftEndCap:SetWidth(256);
MainMenuBarLeftEndCap:SetHeight(129);

MainMenuBarRightEndCap:SetTexture("Interface\\AddOns\\aesyr\\skull-left-small.tga");
MainMenuBarRightEndCap:ClearAllPoints();
MainMenuBarRightEndCap:SetPoint("LEFT", MainMenuBar, "RIGHT", -10, 33);
MainMenuBarRightEndCap:SetWidth(256);
MainMenuBarRightEndCap:SetHeight(129);

-- Adding necessary margin to Tukz oUF Unitframes to sit above the default blizzard bars

local ouf_margin = 160;

oUF_Tukz_player:SetPoint("BOTTOMLEFT", MainMenuBar, "TOPLEFT", 0, ouf_margin)
oUF_Tukz_target:SetPoint("BOTTOMRIGHT", MainMenuBar, "TOPRIGHT", 0, ouf_margin)
oUF_Tukz_pet:SetPoint("BOTTOM", MainMenuBar, "TOP", 0, ouf_margin+41)
oUF_Tukz_focus:SetPoint("CENTER", InfoRight, "CENTER")
oUF_Tukz_targettarget:SetPoint("BOTTOM", MainMenuBar, "TOP", 0, ouf_margin)

-- Adding more spells to ClassTimer
if UnitClass( 'player' ) == 'Warrior' then
end


print('Aesyr Theme for Tukui loaded.');
