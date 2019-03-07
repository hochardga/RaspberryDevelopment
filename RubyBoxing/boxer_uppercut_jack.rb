class BoxerUppercutJack < Boxer
  def initialize
    @name = "Uppercut Jack"
    @opening_line = "Watch out for my UPPERCUT!"
    @moves = [
        Move.new('massive uppercut', hit_damage: 75)
      ]
    super()
  end
end