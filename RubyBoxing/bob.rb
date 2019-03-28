class Bob < Fighter
  def initialize
    @name = "Bob"
    @opening_line = "Hi, I'm"
    @moves = [
        Move.new('Bobs kick kick', hit_damage: 7000),
        Move.new('Bobby Bomber', hit_chance: 90),
        Move.new('Bobs move', stun_chance: 50),
        Move.new('healing dodge', hit_chance: 50, hit_damage: 25, heal_amount: 25),
      ]

    @special_move = SpecialMove.new('Bobs special move', hit_damage: 80)
    super
  end
end