local items = 	{
	{
		name = "skirmish",
		control = WG.BattleRoomWindow.GetSingleplayerControl(VFS.Include(LUA_DIRNAME .. "configs/gameConfig/byar/singleplayerQuickSkirmish.lua")),
		entryCheck = WG.BattleRoomWindow.SetSingleplayerGame,
	},
	{
		name = "scenarios",
		control = WG.ScenarioHandler.GetControl(),
		--startWithTabOpen = 1,
	},
	{
		name = "load_game",
		control = WG.LoadGameWindow.GetControl(),
		entryCheck = WG.BattleRoomWindow.SetSingleplayerGame,
	},
}

--[[self.btnSteamFriends:SetVisibility(Configuration.canAuthenticateWithSteam)
local function onConfigurationChange(listener, key, value)
	if key == "canAuthenticateWithSteam" then
		self.btnSteamFriends:SetVisibility(value)
	end
end
--]]
return items