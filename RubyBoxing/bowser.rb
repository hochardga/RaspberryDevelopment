class Bowser < Fighter
  def initialize
    @name = "Bowser"
    @opening_line = "WRAAAAHHHH!!!!!"
    @moves = [
        Move.new('BRAWGH!', EFFECT_TYPES::DAMAGE, 20),
        Move.new('shell spin', EFFECT_TYPES::STUN, 40),
      ]
    @special_move = SpecialMove.new 'brrrrragh!', EFFECT_TYPES::DAMAGE, 20
    super 31 # red
  end
end