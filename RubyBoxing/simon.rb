class Simon < Fighter
  def initialize color
    @name = "Simon"
    @opening_line = "I like to punch a lot"
    @moves = [
        Move.new('whip', hit_chance: 60),
        Move.new('axe throw', stun_chance: 10),
        Move.new('holy water', hit_damage: 90),
        Move.new('cross', hit_chance: 33, stun_chance: 33, hit_damage: 33),
      ]
    super(color)
  end
end
