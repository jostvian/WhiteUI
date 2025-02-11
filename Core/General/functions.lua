local WUI = unpack(WhiteUI)

local ReloadUI = ReloadUI
local C_AddOns = C_AddOns

function WUI:Notification(string, button1 ,AcceptFunction, button2, DeclineFunction)
    local Frame = "Notification"

    StaticPopupDialogs[Frame] = {
        text = string,
        button1 = button1,
        button2 = button2,
        OnAccept = AcceptFunction,
        OnCancel = DeclineFunction,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        preferredIndex = 3,
    }
    StaticPopup_Show(Frame)
end

function WUI:LoadData() 
    local AddOn = "WhiteUI_Data"

	if C_AddOns.LoadAddOn(AddOn) then
		return
	end

	if not self:IsAddOnEnabled(AddOn) then
		C_AddOns.EnableAddOn(AddOn)
	end

	C_AddOns.LoadAddOn(AddOn)
end