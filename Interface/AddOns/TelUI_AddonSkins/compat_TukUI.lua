--[[
	Compatibility layer for TukUI v10 and v11
	
	Provides the base implementation of Mod_AddonSkins, Skin, Layout, and TelUI.config needed to
	support skinning inside of the TukUI environment. There is no OOP or memory management
	available.
	
	File version v39.40
	(C)2010 Darth Android / Telroth-Black Dragonflight
]]

-- Don't run if TelUI is loaded, or TukUI isn't.
if IsAddOnLoaded("TelUI") or Mod_AddonSkins or not IsAddOnLoaded("Tukui") or not TukuiDB then return end

local TukVer = tonumber(TukuiDB.version)

Mod_AddonSkins = CreateFrame("Frame")
local Mod_AddonSkins = Mod_AddonSkins

-- To cope with V10 -> V11 changes, all functions which take 1 argument have the argument simply duplicated.
local tukskin = TukuiDB.SetTemplate
local function skinFrame(self, frame)
	tukskin(frame,frame)
end
local function skinButton(self, button)
	skinFrame(self, button)
	-- Crazy hacks which only work because self = Skin *AND* self = config
	local name = button:GetName()
	local icon = _G[name.."Icon"]
	if icon then
		icon:SetTexCoord(unpack(self.buttonZoom))
		icon:SetDrawLayer("ARTWORK")
		icon:ClearAllPoints()
		icon:SetPoint("TOPLEFT",button,"TOPLEFT",self.borderWidth, -self.borderWidth)
		icon:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",-self.borderWidth, self.borderWidth)
	end
end
Mod_AddonSkins.SkinFrame = skinFrame
Mod_AddonSkins.SkinBackgroundFrame = skinFrame
Mod_AddonSkins.SkinButton = skinButton
if TukuiCF then
	Mod_AddonSkins.normTexture = TukuiCF.media.normTex
	Mod_AddonSkins.bgTexture = TukuiCF.media.blank
	Mod_AddonSkins.font = TukuiCF.media.font
	Mod_AddonSkins.smallFont = TukuiCF.media.font
else
	Mod_AddonSkins.normTexture = TukuiDB.media.normTex
	Mod_AddonSkins.bgTexture = TukuiDB.media.blank
	Mod_AddonSkins.font = TukuiDB.media.font
	Mod_AddonSkins.smallFont = TukuiDB.media.font
end
Mod_AddonSkins.fontSize = 12
Mod_AddonSkins.buttonSize = TukuiDB.Scale(27,27)
Mod_AddonSkins.buttonSpacing = TukuiDB.Scale(4,4)
Mod_AddonSkins.borderWidth = TukuiDB.Scale(2,2)
Mod_AddonSkins.buttonZoom = {.09,.91,.09,.91}
Mod_AddonSkins.barSpacing = TukuiDB.Scale(1,1)
Mod_AddonSkins.barHeight = TukuiDB.Scale(20,20)
Mod_AddonSkins.skins = {}

-- Dummy function expected by some skins
function dummy() end


function Mod_AddonSkins:RegisterSkin(name, initFunc)
	self = Mod_AddonSkins -- Static function
	if type(initFunc) ~= "function" then error("initFunc must be a function!",2) end
	self.skins[name] = initFunc
	if name == "LibSharedMedia" then -- Load LibSharedMedia early.
		initFunc(self, self, self, self, self)
		self.skins[name] = nil
	end
end

Mod_AddonSkins:RegisterEvent("PLAYER_LOGIN")
Mod_AddonSkins:SetScript("OnEvent",function(self)
	self:UnregisterEvent("PLAYER_LOGIN")
	self:SetScript("OnEvent",nil)
	-- Initialize all skins
	for name, func in pairs(self.skins) do
		func(self,self,self,self,self) -- Mod_AddonSkins functions as skin, layout, and config.
	end
end)