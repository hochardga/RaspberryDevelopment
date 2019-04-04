class Bob < Fighter
  def initialize
    @name = "Bob"
    @opening_line = "Hi, I'm bob"
    @moves = [
        # <KIDS> effects
      # :damage     Takes away from opponents hp
      # :heal       Adds to your hp
      # :stun       Makes opponents skip rounds
      # :haste      Gives you extra rounds
      # :slow
      # :strengthen Doubles the effect
      # :poison     Reduces opponents effect
      
      Move.new('hard punch', :damage, 25),
      Move.new('Bobs kicky kick', :damage, 30),
      Move.new('Bobby Bomber', :stun, 75),
      Move.new('Bobs move', :stun, 25 ),
      Move.new('healing dodge', :heal, 45),
    ]

    @special_move = SpecialMove.new('Bobs special move', :stun, 35)
    super
  end
end
