class PrincessPeach < Fighter
  def initialize color
    @name = "Princess Peach"
    @opening_line = "Hi-cha"
    @moves = [
        MovesList::HEAL,
        Move.new('booty bump', hit_chance: 50, stun_chance: 50)
      ]
    @special_move = SpecialMove.new '*music*', heal_amount: 80
    super(35) # pink
  end
end