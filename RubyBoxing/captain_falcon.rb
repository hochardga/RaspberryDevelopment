
class CaptainFalcon < Fighter
  def initialize
    @name = "Cap'n Falcon"
    @opening_line = "SHOW ME YA MOVES!"
    @moves = [
        Move.new('Flaming Fury', hit_chance: 90),
        Move.new('Blue Falcon', hit_damage: 90),
        Move.new('Falcon Kick!!', hit_chance: 33, stun_chance: 33, hit_damage: 33),
        Move.new('Falcom PUNCH!!', hit_damage: 90, stun_chance: 0)
    ]
    super
  end
end
