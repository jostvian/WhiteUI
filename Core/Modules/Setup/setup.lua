local WUI = unpack(WhiteUI)
local SE = WUI:GetModule("Setup")

local AceDB = LibStub("AceDB-3.0")

local Profile = "White"
local pairs = pairs
local SetupTable = {}


do
	if WUI:IsAddOnEnabled("ElvUI") then
		E = unpack(ElvUI)
	end
end

local function SetupComplete(addon)
    local PluginInstallStepComplete = PluginInstallStepComplete

	if PluginInstallStepComplete then
		PluginInstallStepComplete:Hide()
		PluginInstallStepComplete.message = "Success"
		PluginInstallStepComplete:Show()
	end

	if not addon then
		return
	end

	if not WUI.db.global.profiles then
		WUI.db.global.profiles = {}
	end

	WUI.db.global.profiles[addon] = true
end

local function IsProfileExisting(db)
	local Database = AceDB:New(db)
	local Profiles = Database:GetProfiles()

	for i = 1, #Profiles do
		if Profiles[i] == Profile then

			return true
		end
	end
end

function SetupTable.Bartender4(import, addon)
    local Bartender4DB = Bartender4DB
    local Database =AceDB:New(Bartender4DB)

    if import then
        SetupComplete(addon)
        pairs(WUI.BarTenderData) do
            -
        --- TODO: HAGA ALGO AQUÍ OmniCDDB.profiles[Profile] = NUI.OmniCDData
    end

    if not IsProfileExisting(Bartender4DB) then
        WUI.db.global.profiles[addon] = nil
        return
    end
    Database:SetProfile(Profile)
end

