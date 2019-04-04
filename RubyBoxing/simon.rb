class Simon < Fighter
  def initialize
    @name = "Simon"
    @opening_line = "Evil must be destroyed!"

    # <KIDS> The number at the end is the hit chance.  The rest gets applied to the effect.  Meaning low hit chance means more damage.
    
    # <KIDS> effects
    # :damage     Takes away from opponents hp
    # :heal       Adds to your hp
    # :stun       Makes opponents skip rounds
    # :haste      Gives you extra rounds
    # :slow       Reduces opponents hit chance
    # :strengthen Doubles the effect
    # :poison     Reduces opponents effect

    #Move.new('++NAME OF THE MOVE++', :++EFFECT TYPE++, ++HIT CHANCE++),
    @moves = [
        Move.new('whip', :damage, 40),
        Move.new('axe throw', :stun, 35),
        Move.new('holy water', :damage, 50),
        Move.new('cross', :stun, 30), 
      ]
    
    # special moves effects are trippled
    @special_move = SpecialMove.new('stake jab', :damage, 10)
    super
  end
end
