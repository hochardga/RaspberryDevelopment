# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class SpecialMove < Move

  def initialize title, effect = EFFECT_TYPES::DAMAGE, hit_chance = 50
    super(title, effect, hit_chance)
    @effect_amount = @effect_amount * 3
  end
end