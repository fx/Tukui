if (TukuiCF == nil) then return; end

local LSM = LibStub("LibSharedMedia-3.0")

if LSM == nil then return; end

LSM:Register("statusbar","TukUI Bar",TukuiCF.media.normTex)
LSM:Register("background","TukUI",TukuiCF.media.blank)
LSM:Register("font","TukUI",TukuiCF.media.font)
LSM:Register("font","TukUI UF",TukuiCF.media.uffont)
LSM:Register("font","TukUI Damage",TukuiCF.media.dmgfont)
LSM:Register("font","TukUI Pixel",TukuiCF.media.pixelfont)