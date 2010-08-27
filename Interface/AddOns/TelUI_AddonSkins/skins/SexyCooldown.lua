--[[
	SexyCooldown Skin by Darth Android / Telroth - Black Dragonflight
	
	Skins SexyCooldown to look like TelUI.
	 
	(C)2010 Darth Android / Telroth - Black Dragonflight
	File version v17.40
]]

if not Mod_AddonSkins or not SexyCooldown then return end
local scd = SexyCooldown
local L = LibStub("AceLocale-3.0"):GetLocale("SexyCooldown")

Mod_AddonSkins:RegisterSkin("SexyCooldown",function(Skin,skin,Layout,layout,config)
	-- String skinning settings from in-game GUI
	function Skin:SCDStripSkinSettings(bar)
		-- Remove conflicting options
		bar.optionsTable.args.icon.args.borderheader = nil
		bar.optionsTable.args.icon.args.border = nil
		bar.optionsTable.args.icon.args.borderColor = nil
		bar.optionsTable.args.icon.args.borderSize = nil
		bar.optionsTable.args.icon.args.borderInset = nil
		--bar.optionsTable.args.icon.args.sizeOffset = nil
		bar.optionsTable.args.bar.args.bnbheader = nil
		bar.optionsTable.args.bar.args.texture = nil
		bar.optionsTable.args.bar.args.backgroundColor = nil
		bar.optionsTable.args.bar.args.border = nil
		bar.optionsTable.args.bar.args.borderColor = nil
		bar.optionsTable.args.bar.args.borderSize = nil
		bar.optionsTable.args.bar.args.borderInset = nil
	end
	-- Strip positioning settings from in-game GUI
	function Layout:SCDStripLayoutSettings(bar)
		-- Override variables
		bar.settings.bar.lock = true
		bar.settings.bar.inactiveAlpha = 1
		--remove settings which are no longer relavent for this bar
		bar.optionsTable.args.copy = nil
		bar.optionsTable.args.bar.args.lock = nil
		bar.optionsTable.args.bar.args.orientation.values = {
			LEFT_TO_RIGHT = L["Left to Right"],
			RIGHT_TO_LEFT = L["Right to Left"]
		}
		bar.optionsTable.args.bar.args.positioning = nil
		bar.optionsTable.args.bar.args.height = nil
		bar.optionsTable.args.bar.args.width = nil
		bar.optionsTable.args.bar.args.x = nil
		bar.optionsTable.args.bar.args.y = nil
		bar.optionsTable.args.bar.args.inactiveAlpha = nil
	end
	-- Don't move the bars, but a layout could integrate them
	Layout.PositionSexyCooldownBar = dummy
	
	Skin.SkinSexyCooldownBar = function(self, bar)
		self:SCDStripSkinSettings(bar)
		self:SkinFrame(bar)
	end
	-- Icons can be skinned, but not by default
	Skin.SkinSexyCooldownIcon = dummy

	-- Hook bar creation to add skinning
	scd.CreateBar_ = scd.CreateBar
	scd.CreateBar = function(self, settings, name)
		local bar = scd:CreateBar_(settings,name)
		bar.UpdateBarLook_ = bar.UpdateBarLook
		bar.UpdateBarLook = function(self)
			self:UpdateBarLook_()
			skin:SkinSexyCooldownBar(self)
			layout:PositionSexyCooldownBar(self)
		end
		bar.UpdateSingleIconLook_ = bar.UpdateSingleIconLook
		bar.UpdateSingleIconLook = function(self,icon)
			self:UpdateSingleIconLook_(icon)
			skin:SkinSexyCooldownIcon(bar,icon)
		end
		return bar
	end
	-- Skin Pre-existing bars
	for _,bar in ipairs(scd.bars) do
		bar.UpdateBarLook_ = bar.UpdateBarLook
		bar.UpdateBarLook = function(self)
			self:UpdateBarLook_()
			skin:SkinSexyCooldownBar(self)
			layout:PositionSexyCooldownBar(self)
		end
		bar.UpdateSingleIconLook_ = bar.UpdateSingleIconLook
		bar.UpdateSingleIconLook = function(self,icon)
			self:UpdateSingleIconLook_(icon)
			skin:SkinSexyCooldownIcon(bar,icon)
		end
		bar:UpdateBarLook()
	end
end)


--local buttonsize = TukuiDB:Scale(27)
--local buttonspacing = TukuiDB:Scale(4)

local ABResized = false
local function IntegrateActionBar(frame)
	--Increase the size of the bottom action bar to fit
	if (ABResized == false) then
		ActionBarBackground:SetHeight(ActionBarBackground:GetHeight() + buttonsize + buttonspacing)
		ABResized = true
	end
	-- Lock Positioning
	frame.OldUpdateBarLook = frame.UpdateBarLook
	frame.UpdateBarLook = function(self)
		self:OldUpdateBarLook()
		self:ClearAllPoints()
		self:SetHeight(buttonsize)
		self:SetWidth(ActionBarBackground:GetWidth() - 2 * buttonspacing)
		self:SetPoint("TOPLEFT",ActionBarBackground,"TOPLEFT",buttonspacing,-buttonspacing)
		self:SetPoint("TOPRIGHT",ActionBarBackground,"TOPRIGHT",-buttonspacing,-buttonspacing)	
	end
	-- Override variables
	frame.settings.bar.lock = true
	frame.settings.bar.inactiveAlpha = 1
	--remove settings which are no longer relavent for this bar
	frame.optionsTable.args.copy = nil
	frame.optionsTable.args.bar.args.lock = nil
	frame.optionsTable.args.bar.args.orientation.values = {
		LEFT_TO_RIGHT = L["Left to Right"],
		RIGHT_TO_LEFT = L["Right to Left"]
	}
	frame.optionsTable.args.bar.args.positioning = nil
	frame.optionsTable.args.bar.args.height = nil
	frame.optionsTable.args.bar.args.width = nil
	frame.optionsTable.args.bar.args.x = nil
	frame.optionsTable.args.bar.args.y = nil
	frame.optionsTable.args.bar.args.inactiveAlpha = nil
end

local function IntegrateInfoLeft(frame)
	-- Lock positioning
	frame.OldUpdateBarLook = frame.UpdateBarLook
	frame.UpdateBarLook = function(self)
		self:OldUpdateBarLook()
		self:ClearAllPoints()
		self:SetPoint("CENTER",InfoLeft,"CENTER",0,0)
		self:SetHeight(InfoLeft:GetHeight())
		self:SetWidth(InfoLeft:GetWidth())
	end

	-- Override variables
	frame.settings.bar.lock = true
	frame.settings.bar.inactiveAlpha = 0
	-- Remove settings which are no longer relavent for this bar
	frame.optionsTable.args.copy = nil
	frame.optionsTable.args.bar.args.lock = nil
	frame.optionsTable.args.bar.args.orientation.values = {
		LEFT_TO_RIGHT = L["Left to Right"],
		RIGHT_TO_LEFT = L["Right to Left"]
	}
	frame.optionsTable.args.bar.args.positioning = nil
	frame.optionsTable.args.bar.args.height = nil
	frame.optionsTable.args.bar.args.width = nil
	frame.optionsTable.args.bar.args.x = nil
	frame.optionsTable.args.bar.args.y = nil
	frame.optionsTable.args.bar.args.inactiveAlpha = nil
end

local function IntegrateInfoRight(frame)
	-- Lock positioning
	frame.OldUpdateBarLook = frame.UpdateBarLook
	frame.UpdateBarLook = function(self)
		self:OldUpdateBarLook()
		self:ClearAllPoints()
		self:SetPoint("CENTER",InfoRight,"CENTER",0,0)
		self:SetHeight(InfoRight:GetHeight())
		self:SetWidth(InfoRight:GetWidth())
	end
	-- Override variables
	frame.settings.bar.lock = true
	frame.settings.bar.inactiveAlpha = 0
	-- Remove settings which are no longer relavent for this bar
	frame.optionsTable.args.copy = nil
	frame.optionsTable.args.bar.args.lock = nil
	frame.optionsTable.args.bar.args.orientation.values = {
		LEFT_TO_RIGHT = L["Left to Right"],
		RIGHT_TO_LEFT = L["Right to Left"]
	}
	frame.optionsTable.args.bar.args.positioning = nil
	frame.optionsTable.args.bar.args.height = nil
	frame.optionsTable.args.bar.args.width = nil
	frame.optionsTable.args.bar.args.x = nil
	frame.optionsTable.args.bar.args.y = nil
	frame.optionsTable.args.bar.args.inactiveAlpha = nil
end



local function SkinBar(frame)
	-- Override bar skinning
	frame.UpdateBarBackdrop = function(self)
		self:SetBackdrop({
			bgFile = TukuiDB["media"].blank, 
			edgeFile = TukuiDB["media"].blank, 
			tile = false, tileSize = 0, edgeSize = TukuiDB.mult, 
			insets = { left = -TukuiDB.mult, right = -TukuiDB.mult, top = -TukuiDB.mult, bottom = -TukuiDB.mult}
		})
		if frame.skin and frame.skin.nobackground then
			self:SetBackdropColor(0,0,0,0)
		else
			self:SetBackdropColor(unpack(TukuiDB["media"].backdropcolor))
		end
		if frame.skin and frame.skin.noborder then
			self:SetBackdropBorderColor(0,0,0,0)
		else
			self:SetBackdropBorderColor(unpack(TukuiDB["media"].bordercolor))
		end
	end
	-- Override cooldown skinning
	frame.UpdateSingleIconLook_ = frame.UpdateSingleIconLook
	frame.UpdateSingleIconLook = function(self, icon)
		frame:UpdateSingleIconLook_(icon)
		if frame.skin and frame.skin.noiconborder then
			icon:SetBackdrop({
				bgFile = TukuiDB["media"].blank, 
				edgeFile = TukuiDB["media"].blank, 
				tile = false, tileSize = 0, edgeSize = 0, 
				insets = { left = 0, right = 0, top = 0, bottom = 0}
			})
			icon:SetBackdropBorderColor(0,0,0,0)
		else
			icon:SetBackdrop({
				bgFile = TukuiDB["media"].blank, 
				edgeFile = TukuiDB["media"].blank, 
				tile = false, tileSize = 0, edgeSize = TukuiDB.mult, 
				--insets = { left = -TukuiDB.mult, right = -TukuiDB.mult, top = -TukuiDB.mult, bottom = -TukuiDB.mult}
				insets = { left = 0, right = 0, top = 0, bottom = 0}
			})
			icon:SetBackdropBorderColor(unpack(TukuiDB["media"].bordercolor))
		end
		icon:SetBackdropColor(0,0,0,0)
	end
	-- Skinning options
	frame.settings.icon.borderInset = 2
	-- Copy bar-specific settings
	frame.skin = TukuiDB.skins.SexyCooldown[frame.settings.bar.name]
	-- Integrate bars if necessary
	if TukuiDB.skins.SexyCooldown.actionbar == frame.settings.bar.name then
		IntegrateActionBar(frame)
	end
	if TukuiDB.skins.SexyCooldown.infoleft == frame.settings.bar.name then
		IntegrateInfoLeft(frame)
	end
	if TukuiDB.skins.SexyCooldown.inforight == frame.settings.bar.name then
		IntegrateInfoRight(frame)
	end
	frame:UpdateBarLook()
end





