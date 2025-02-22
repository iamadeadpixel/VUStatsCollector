-- Code used from Doc-Ice-Elm's VU-stats

-- insert title text
title="Pixel #6 Mod test server"

--Settings
inputPress = InputDeviceKeys.IDK_F5 -- Input for Open / Close the Menu
local isStatsEnabled = true
-- Load the WebUI
Events:Subscribe('Extension:Loaded', function()
    WebUI:Init()

	print("UI initialized.")
end)

Events:Subscribe("Player:Connected", function(player)
	WebUI:Show()
	print("UI is now ready !")
end)

-- When key is pressed, show, and hide when unpress

Events:Subscribe('Client:UpdateInput', function(data)
	if InputManager:WentKeyDown(inputPress) then
	  isStatsEnabled = not isStatsEnabled

  if isStatsEnabled then
    WebUI:Show()
  else
    WebUI:Hide()
  end
		
	end
end)


NetEvents:Subscribe('showstats', function(player,message)
	WebUI:ExecuteJS("showMessage('"..message.."');")
end)


