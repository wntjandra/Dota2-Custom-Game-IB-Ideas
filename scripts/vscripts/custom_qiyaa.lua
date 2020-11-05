custom_qiyaa = class({})

function custom_qiyaa:OnSpellStart()
	local  target = self:GetCursorTarget()
	local caster = self:GetCaster()

	if target ~= nil then
		local damageTable = {
			victim = target,
			attacker = caster,
			damage = self:GetAbilityDamage(),
			damage_type = self:GetAbilityDamageType(),
		}
		ApplyDamage(damageTable)
	end
end