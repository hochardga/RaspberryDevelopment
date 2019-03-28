class PrincessPeach < Fighter
  def initialize
    @name = "Princess Peach"
    @opening_line = "Hi-cha"
    @moves = [
        Move.new('heal', EFFECT_TYPES::HEAL, 50),
        Move.new('booty bump', EFFECT_TYPES::STUN, 50)
      ]
    @special_move = SpecialMove.new '*music*', EFFECT_TYPES::HEAL, 20
    super 35 # pink
  end
end