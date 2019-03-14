class Bowser < Fighter
  def initialize color
    @name = "Bowser"
    @opening_line = "WRAAAAHHHH!!!!!"
    @moves = [
        Move.new('BRAWGH!', hit_damage: 80),
        Move.new('shell spin', stun_chance: 40),
      ]
    @special_move = SpecialMove.new 'brrrrragh!', hit_damage: 80
    super(31) # red
  end
end