custom_qiyaa = class({})
LinkLuaModifier( "intimidated_modifier_lua", LUA_MODIFIER_MOTION_NONE )

function custom_qiyaa:OnSpellStart()
	local target = self:GetCursorTarget()
	local caster = self:GetCaster()
	local pullDuration = self:GetSpecialValueFor("pull_duration")
	caster:EmitSound("ib.PeePawAbility1")
	
	if target ~= nil then
		local damageTable = {
			victim = target,
			attacker = caster,
			damage = self:GetAbilityDamage(),
			damage_type = self:GetAbilityDamageType(),
		}
		ApplyDamage(damageTable)
		
		target:AddNewModifier(caster, self, "intimidated_modifier_lua", {duration = pullDuration})
	end
end

