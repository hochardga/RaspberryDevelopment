class LittleMac < Fighter
  def initialize color
    @name = "Little Mac"
    @opening_line = "Hey, what's that?!?!"
    @moves = [
      Move.new('Jab', hit_chance: 60, stun_chance: 0, hit_damage: 40),
      Move.new('Bonkers', hit_chance: 40, stun_chance: 60),
      Move.new('uppercut', hit_chance: 20, hit_damage: 80)
      ]
    super(color)
  end
end
