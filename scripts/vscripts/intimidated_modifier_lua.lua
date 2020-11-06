intimidated_modifier_lua = class({})

--------------------------------------------------------------------------------

function intimidated_modifier_lua:IsDebuff()
	return true
end

--------------------------------------------------------------------------------

function intimidated_modifier_lua:IsStunDebuff()
	return true
end

--------------------------------------------------------------------------------

function intimidated_modifier_lua:GetEffectName()
	return "particles/generic_gameplay/generic_stunned.vpcf"
end

--------------------------------------------------------------------------------

function intimidated_modifier_lua:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end

--------------------------------------------------------------------------------

function intimidated_modifier_lua:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
	}

	return funcs
end

--------------------------------------------------------------------------------
 
function intimidated_modifier_lua:GetOverrideAnimation( params )
	return ACT_DOTA_DISABLED
end

--------------------------------------------------------------------------------

function intimidated_modifier_lua:CheckState()
	local state = {
	[MODIFIER_STATE_STUNNED] = true,
	}

	return state
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
