local WUI = unpack(WhiteUI)

WUI.title = "WhiteUI"
WUI.version = tonumber(C_AddOns.GetAddOnMetadata("WhiteUI", "Version"))
WUI.myname = UnitName("player")
WUI.myrealm = GetRealmName()
WUI.mynameRealm = format("%s - %s", WUI.myname, WUI.myrealm)

WUI.reloadRequired = false

local function InitializeDetails()
    local Details = Details
    if Details.is_first_run and #Details.custon == 0 then
        Details.AddDefaultCustomDisplays()
    end
    Details.character_first_run = false
    Details.is_first_run = false
    Details.is_version_first_run = false
end
   
function WUI:Initialize()
    if self:IsAddOnEnabled("Details") then
        InitializeDetails()
    end
    
    if self.db.global.profiles and not self.db.char.installed then 
       -- self:Notification("Do you wish to load your selected WhiteUI profiles onto this character?", "Yes", function() self:LoadProfiles() end, "No", function() self.db.char.installed = true end)
    end

end