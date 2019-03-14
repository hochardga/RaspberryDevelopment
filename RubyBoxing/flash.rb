class Flash < Fighter
  def initialize color
    @name = "Flash"
    @opening_line = "Hey, what's that?!?!"
    @moves = [
      Move.new('looky here', hit_chance: 50, stun_chance: 40),
      Move.new('over here', hit_chance: 40, stun_chance: 50),
      Move.new('eye poke', hit_chance: 10, stun_chance: 80)
      ]

    @special_move = SpecialMove.new('!~SUPPER STUN~!', stun_chance: 50, hit_damage: 50)
    super(36) # cyan
  end
end