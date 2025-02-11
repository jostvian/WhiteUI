local WUI = unpack(WhiteUI)
local SE = WUI:GetModule("Setup")

WUI.Options = {
    name = "WhiteUI",
    type = "group",
    args = {
        saveProfiles = {
            name = "Save Profiles",
            type = "group",
            args = {
                bigwigs = {
                    name = "Details",
                    desc = "Save current Details profile",
                    type = "execute",
                    hidden = function() return not WUI:IsAddOnEnabled("Details") end,
                    func = function()
                        WhiteUI:SaveDetails()
                    end
                },
            }
        },
        loadProfiles = {
            name = "Load Profiles",
            type = "group",
            args = {
                bigwigs = {
                    name = "Bartender4",
                    desc = "Load Bartender4 saved or default profile",
                    type = "execute",
                    hidden = function() return not WUI:IsAddOnEnabled("Bartender4") end,
                    func = function()
                        SE:Setup("Bartender4", true)
                    end
                },
            }
        },
    }
}