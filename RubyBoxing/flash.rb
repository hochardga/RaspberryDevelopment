class Flash < Fighter
  def initialize
    @name = "Flash"
    @opening_line = "Hey, what's that?!?!"
    @moves = [
      Move.new('looky here', EFFECT_TYPES::STUN, 10),
      Move.new('over here', EFFECT_TYPES::STUN, 40),
      Move.new('eye poke', EFFECT_TYPES::STUN, 80)
      ]

    @special_move = SpecialMove.new('!~SUPPER STUN~!', EFFECT_TYPES::DAMAGE, 25)
    super 36 # cyan
  end
end