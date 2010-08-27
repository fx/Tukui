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
--oUF_Tukz_focus:SetPoint("RIGHT", InfoRight, "CENTER")
oUF_Tukz_targettarget:SetPoint("BOTTOM", MainMenuBar, "TOP", 0, ouf_margin)

-- Adding more spells to ClassTimer
if UnitClass( 'player' ) == 'Warrior' then
end

-- to disable the retarded Tukui Actionbars and panels, you'll need to set actionbar.enable to false in config.lua
-- and these hacks are here, because half of the unmaintained POS code in Tukui doesn't even honor these settings
-- or is just retarded, like "if enable == true OR not IsAddOnLoaded()" in panels.lua ..check it out, it's hilarious

TukuiActionBarBackgroundRight:Hide();
--TukuiActionBarBackground:Hide();
-- Can't hide this, because all other panels are children of it
TukuiActionBarBackground:SetHeight(0.0);
TukuiInfoLeftLineVertical:Hide();
TukuiInfoRightLineVertical:Hide();
TukuiCubeLeft:Hide();
TukuiCubeRight:Hide();
TukuiLineToABLeft:Hide();
TukuiLineToABRight:Hide();

FocusFrame:SetWidth(20);

print('Aesyr Theme for Tukui loaded.');
