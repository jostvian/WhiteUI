local WUI = unpack(WhiteUI)

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
                    name = "Details",
                    type = "execute",
                    func = function()
                        WhiteUI:LoadDetails()
                    end
                },
            }
        },
    }
}