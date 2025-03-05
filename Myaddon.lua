local frame = CreateFrame("Frame")

local ahOpen = false

-- Función para depurar
local function PrintDebugMessage(msg)
    DEFAULT_CHAT_FRAME:AddMessage(msg)
end

-- Escucha eventos
frame:RegisterEvent("AUCTION_HOUSE_SHOW")
frame:RegisterEvent("AUCTION_HOUSE_CLOSED")

-- Manejar eventos
frame:SetScript("OnEvent", function(self, event)
    if event == "AUCTION_HOUSE_SHOW" then
        ahOpen = true
    elseif event == "AUCTION_HOUSE_CLOSED" then
        ahOpen = false
    end
end)



local function ReloadAH()
    if ahOpen then
        --Commodities
        if AuctionHouseFrame.CommoditiesBuyFrame:IsShown() then
            AuctionHouseFrame.CommoditiesBuyFrame.ItemList.RefreshFrame.RefreshButton:Click()
            -- elseif AuctionHouseFrame.CommoditiesSellList:IsShown() then
            --   AuctionHouseFrame.CommoditiesSellList.ItemList.RefreshFrame.RefreshButton:Click()
            --Items
        elseif AuctionHouseFrame.ItemBuyFrame:IsShown() then
            AuctionHouseFrame.ItemBuyFrame.ItemList.RefreshFrame.RefreshButton:Click()
            --elseif AuctionHouseFrame.ItemSellList:IsShown() then
            --  AuctionHouseFrame.ItemSellList.ItemList.RefreshFrame.RefreshButton:Click()
        elseif AuctionHouseFrameAuctionsFrame.AllAuctionsList:IsShown() then
            AuctionHouseFrameAuctionsFrame.AllAuctionsList.RefreshFrame.RefreshButton:Click()
        end
    end
end

local function BuyThings()
    if ahOpen then
        AuctionHouseFrame.CommoditiesBuyFrame.BuyDisplay.BuyButton:Click()
    end
end

local function ConfirmBuy()
    if ahOpen then
        AuctionHouseFrame.BuyDialog.BuyNowButton:Click()
    end
end


-- Manejar eventos de teclado
frame:SetScript("OnKeyDown", function(self, key)
    if key == "F5" then
        ReloadAH()
    end

    if key == "F4" then
        BuyThings()
    end

    if key == "F3" then
        ConfirmBuy()
    end
end)

-- Configura el frame para recibir eventos
frame:Show()
frame:SetPropagateKeyboardInput(true)
frame:SetFocus()
