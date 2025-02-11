LibStub = LibStub or _G.LibStub
local C_AddOns_GetAddOnEnableState = C_AddOns.GetAddOnEnableState

local AddOnName, Engine = ...
WUI = LibStub("AceAddon-3.0"):NewAddon(AddOnName, "AceConsole-3.0")

Engine[1] = WUI
_G.WhiteUI = Engine

WUI.Setup = WUI:NewModule("Setup", "AceHook-3.0")


function WUI:GetAddOnEnableState(addon, character)
	return C_AddOns_GetAddOnEnableState(addon, character)
end

function WUI:IsAddOnEnabled(addon)
	return WUI:GetAddOnEnableState(addon, WUI.myname) == 2
end

function WUI:OnEnable()
    print("enabled")
	WUI:Initialize()
end


function WUI:OnInitialize()
    print("initialized")
    -- Called when the addon is loaded
    -- Register the slash command
    self:RegisterChatCommand("wui", "ChatCommand")
    -- Register options table
    LibStub("AceConfig-3.0"):RegisterOptionsTable(AddOnName, self.Options, {"wui"})
    -- Register config options
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(AddOnName)
    -- register db
    self.db = LibStub("AceDB-3.0"):New("WhiteUiDB", self.defaults)
end

