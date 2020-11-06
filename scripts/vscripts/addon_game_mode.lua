-- Generated from template

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end





function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end



-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

--  Edit for start up in gamemode - MainActivity start() function
function CAddonTemplateGameMode:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	print("PEepaw is loaded!")
	local GameMode = GameRules:GetGameModeEntity()
	
	--Teams
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 1 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 1 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_1, 1 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_2, 1 )
	GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_3, 1 )
		--DEBUG skip starting game mode stages
	--GameRules:EnableCustomGameSetupAutoLaunch(true)
	--GameRules:SetCustomGameSetupAutoLaunchDelay(0)
	GameRules:SetStrategyTime(20)
	--GameRules:SetHeroSelectionTime(0) --force hero will be used
	GameRules:SetPreGameTime(0)
	GameRules:SetShowcaseTime(0)
	GameRules:SetPostGameTime(0)
	
	--Annoying crap	
	GameMode:SetAnnouncerDisabled(true)
	GameMode:SetKillingSpreeAnnouncerDisabled(true)
	GameMode:SetDayNightCycleDisabled(true)
	GameMode:DisableHudFlip(true)
	GameMode:SetDeathOverLayDisabled(true)
	GameMode:SetWeatherEffectsDisabled(true)


	CreateUnitByName("npc_dota_creature_gnoll_assassin", Vector(0, 1300, 0), true, nil, nil, DOTA_TEAM_BADGUYS)

end

-- Evaluate the state of the game
function CAddonTemplateGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end