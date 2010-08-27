--[[
    MultiCastActionBar Skin
	
	(C)2010

]]

if not Mod_AddonSkins or select(2,UnitClass("player")) ~= "SHAMAN" then return end


Mod_AddonSkins:RegisterSkin("Blizzard_TotemBar",function(Skin,skin,Layout,layout,config)
	-- Skin Flyout
	function Skin.SkinFlyoutFrame(self, flyout)
		flyout.top:SetTexture(nil)
		flyout.middle:SetTexture(nil)
		self:SkinFrame(flyout)
		-- Skin buttons
		for _,button in ipairs(flyout.buttons) do
			self:SkinButton(button)	
		end
		-- Skin Close button
	end
	hooksecurefunc("MultiCastFlyoutFrame_ToggleFlyout",function(self) skin:SkinFlyoutFrame(self) end)
	
	local frame = MultiCastActionBarFrame
end)