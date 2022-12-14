simpleUserWindow = CreateFrame("ScrollFrame", "sUser_Frame", UIParent, "BasicFrameTemplate")
simpleUserWindow:ClearAllPoints()
simpleUserWindow:SetSize(250, 300)
simpleUserWindow:SetPoint("CENTER", UIParent, "CENTER")
simpleUserWindow:SetMovable(true)
simpleUserWindow:EnableMouse(true)
simpleUserWindow:SetUserPlaced(true)
simpleUserWindow:SetScript("OnMouseDown", simpleUserWindow.StartMoving)
simpleUserWindow:SetScript("OnMouseUp", simpleUserWindow.StopMovingOrSizing)
simpleUserWindow.icon = {}
simpleUserWindow.Text = {}
simpleUserWindow.ui = {}
simpleUserWindow.ui.panel = CreateFrame("Frame", "RaidRoll_RespMining_ItemForm", simpleUserWindow, BackdropTemplateMixin and "BackdropTemplate")
simpleUserWindow.ui.panel:ClearAllPoints()
simpleUserWindow.ui.panel:SetSize(240, 40)
simpleUserWindow.ui.panel:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal",  tile = false,});
simpleUserWindow.ui.panel:SetPoint("TOPLEFT", 4, -24)
simpleUserWindow.ui.bgtitle = CreateFrame("Frame", "RaidRoll_RespMining_ItemForm", simpleUserWindow.ui.panel, BackdropTemplateMixin and "BackdropTemplate")
simpleUserWindow.ui.bgtitle:ClearAllPoints()
simpleUserWindow.ui.bgtitle:SetSize(240, 20)
simpleUserWindow.ui.bgtitle:SetPoint("TOPLEFT", 0, 0)
simpleUserWindow.ui.bgtitle:SetBackdrop({bgFile = "Interface/ACHIEVEMENTFRAME/UI-Achievement-Parchment-Horizontal",  tile = false,});
simpleUserWindow.ui.bgtitle:SetBackdropColor(0, 0, 0, 0.8)
simpleUserWindow.ui.icon = CreateFrame("Button", nil, simpleUserWindow.ui.panel, "GameMenuButtonTemplate")
simpleUserWindow.ui.icon:SetPoint("LEFT", simpleUserWindow.ui.panel, "LEFT", 0, 0)
simpleUserWindow.ui.icon:SetSize(45, 45)
simpleUserWindow.ui.icon.overlay = simpleUserWindow.ui.icon:CreateTexture(nil, "OVERLAY")
simpleUserWindow.ui.icon.overlay:SetPoint("LEFT", simpleUserWindow.ui.panel, "LEFT", 0, 0)
simpleUserWindow.ui.icon.overlay:SetSize(45, 45)
simpleUserWindow.ui.title = simpleUserWindow.ui.bgtitle:CreateFontString(nil, "OVERLAY", "GameTooltipText")
simpleUserWindow.ui.title:SetFont("Fonts\\arialn.ttf", 12)
simpleUserWindow.ui.title:SetPoint("TOPLEFT", 55, -2)
simpleUserWindow.ui.title:SetJustifyH("LEFT")
simpleUserWindow:Hide()
simpleUserWindow.ui.icon:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

local simpleUserWindow_ScrollRollItemFrame = CreateFrame("ScrollFrame", "RaidRoll_RespMining_ScrollFrame", simpleUserWindow, "UIPanelScrollFrameTemplate")
simpleUserWindow_ScrollRollItemFrame:SetWidth(220)
simpleUserWindow_ScrollRollItemFrame:SetHeight(190)
simpleUserWindow_ScrollRollItemFrame:SetPoint("TOPLEFT", 0, -100)

simpleUserWindow.rollListFrame = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", simpleUserWindow, BackdropTemplateMixin and "BackdropTemplate")
simpleUserWindow.rollListFrame:ClearAllPoints()
simpleUserWindow.rollListFrame:SetSize(240, 600)
simpleUserWindow.rollListFrame:SetPoint("CENTER", UIParent, "CENTER")
simpleUserWindow_ScrollRollItemFrame:SetScrollChild(simpleUserWindow.rollListFrame)

simpleUserWindow.ui.panel.roll = CreateFrame("Frame", "RaidRoll_RespMining_ItemListForm", simpleUserWindow.ui.panel, BackdropTemplateMixin and "BackdropTemplate")
simpleUserWindow.ui.panel.roll:ClearAllPoints()
simpleUserWindow.ui.panel.roll:SetSize(100, 30)
simpleUserWindow.ui.panel.roll:SetPoint("TOPLEFT", -11, -50)
simpleUserWindow.ui.panel.roll:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab3-Selected", tile = false, tileSize = 1, insets = { left = 0, right = 0, top = -10, bottom = -10 }});
simpleUserWindow.ui.panel.roll:SetScript("OnEnter", function(self)
    simpleUserWindow.ui.panel.roll:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab1-Selected", tile = false, tileSize = 1, insets = { left = 0, right = 0, top = -10, bottom = -10 }});
end)
simpleUserWindow.ui.panel.roll:SetScript("OnLeave", function(self)
    simpleUserWindow.ui.panel.roll:SetBackdrop({bgFile = "Interface/SPELLBOOK/UI-SpellBook-Tab3-Selected", tile = false, tileSize = 1, insets = { left = 0, right = 0, top = -10, bottom = -10 }});
end)
simpleUserWindow.ui.panel.roll:SetScript("OnMouseDown", function()
    RandomRoll(1, 100)
end)
simpleUserWindow.ui.panel.roll.Text = simpleUserWindow.ui.panel.roll:CreateFontString(nil, "OVERLAY", "GameTooltipText")
simpleUserWindow.ui.panel.roll.Text:SetFont("Fonts\\arialn.ttf", 12)
simpleUserWindow.ui.panel.roll.Text:SetPoint("CENTER", 2, 5)
simpleUserWindow.ui.panel.roll.Text:SetJustifyH("LEFT")
simpleUserWindow.ui.panel.roll.Text:SetText("Roll")
simpleUserWindow.ui.panel.roll.Text:Show();