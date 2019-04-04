class LittleMac < Fighter
  def initialize
    @name = "Little Mac"
    @opening_line = "Hey, what's that?!?!"
    @moves = [
      Move.new('Jab', EFFECT_TYPES::DAMAGE, 80),
      Move.new('Gut Punch', EFFECT_TYPES::STUN, 50),
      Move.new('Leaping Hit', EFFECT_TYPES::DAMAGE, 20),
      Move.new('Motivate', EFFECT_TYPES::HASTE, 50),
    ]

    @special_move = SpecialMove.new 'Uppercut!', EFFECT_TYPES::DAMAGE, 50
    super
  end
end
