if GameSetup == nil then
	GameSetup = class({})
end

--DEBUGGING
local forceHero = "npc_dota_hero_custom_meepo"

function GameSetup:init()
	if IsInToolsMode() then
		
		--DEBUG skip starting game mode stages
		GameRules:EnableCustomGameSetupAutoLaunch
		GameRules:SetCustomGameSetupAutoLaunchDelay(0)
		GameRules:SetStrategyTime(0)
		--GameRules:SetHeroSelectionTime(0) --force hero will be used
		GameRule:SetPreGameTime(0)
		GameRule:SetShowcaseTime(0)
		GameRule:SetPostGameTime(5)

		--Annoying crap	
		local GameMode = GameRules:GetGameModeEntity()
		GameMode:SetAnnouncerDisabled(true)
		GameMode:SetKillingSpreeAnnouncerDisabled(true)
		GameMode:SetDayNightCycleDisabled(true)
		GameMode:DisableHudFlip(true)
		GameMode:SetDeathOverLayDisabled(true)
		GameMode:SetWeatherEffectsDisabled(true)

		--Teams
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 1 )
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 1 )
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_1, 1 )
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_2, 1 )
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_2, 1 )

		--Remove tp scroll
		GameRule:GetGameModeENtity():SetItemAddedToInventoryFilter(function(ctx, event) 
			local item = EntIndexToHScript(event.item_entIndex_const)
			if item:GetAbilityName() == "item_tpscroll" and item:GetPurchaser() == nil then return false end
			return true
		end, self)


		--Force hero
		if forceHero ~= nil then
			GameMode:SetCustomGameForceHero(forceHero)
		end
	else

	
	end
end


