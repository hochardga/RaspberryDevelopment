class MrsVentrudo < Fighter
  def initialize color
    @name = "Mrs. Ventrudo"
    @opening_line = "~ ~ ~ whistle ~ ~ ~"
    @moves = [
        Move.new('staring gaze', hit_chance: 50, stun_chance: 50),
        Move.new('load whistle', hit_chance: 75, hit_damage: 25),
        Move.new('teaching lesson', hit_chance: 75, heal_amount: 25),
      ]
    
    @special_move = SpecialMove.new('ABOVE AND BEYOND', hit_damage: 100)
    super color
  end
end