local TextPanels = {
    Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", X = 435, Y = - 145, Width = 431, Height = 42 },
    Background1 = { Dictionary = "commonmenu", Texture = "gradient_bgd", X = 435, Y = - 145, Width = 431, Height = 42 },
    Background2 = { Dictionary = "commonmenu", Texture = "gradient_bgd", X = 435, Y = - 125, Width = 431, Height = 3.5 },
    Text = {
        Left = { X = 440, Y = -139, Scale = 0.35 },
        Right = { X = 440, Y = -139, Scale = 0.35 },
    },
}

---BoutonPanel
---@param LeftText string
---@param RightText string
---@public
function RageUI.CraftBouton(LeftText, RightText, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        local leftTextSize = MeasureStringWidth(LeftText)
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then
            RenderRectangle(CurrentMenu.X + TextPanels.Background.X , CurrentMenu.Y + TextPanels.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42), TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height, 0, 0, 0, 170)
            RenderText(LeftText or "", CurrentMenu.X + TextPanels.Text.Left.X, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + TextPanels.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, TextPanels.Text.Left.Scale, 245, 245, 245, 255, 0)
            RenderText(RightText or "", CurrentMenu.X + 850 + CurrentMenu.WidthOffset - leftTextSize, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + TextPanels.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, TextPanels.Text.Left.Scale, 245, 245, 245, 255, 2)
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1 
        end
    end
end

function RageUI.CraftLigne(Index)
    local CurrentMenu = RageUI.CurrentMenu

    if CurrentMenu ~= nil then
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then
            RenderRectangle(CurrentMenu.X + TextPanels.Background1.X , CurrentMenu.Y + TextPanels.Background1.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42), TextPanels.Background1.Width + CurrentMenu.WidthOffset, TextPanels.Background1.Height, 0, 0, 0, 170)
            RenderRectangle(CurrentMenu.X + TextPanels.Background2.X + 60 , CurrentMenu.Y + TextPanels.Background2.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42), TextPanels.Background2.Width - 120 + CurrentMenu.WidthOffset, TextPanels.Background2.Height, 255, 255, 255, 200)
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end