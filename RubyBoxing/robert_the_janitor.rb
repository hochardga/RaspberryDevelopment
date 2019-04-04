class RobertTheJanator < Fighter
  def initialize
    @name = "Robert the Janator"
    @opening_line = "You're going to get moped!"

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
        Move.new('clean up', :strengthen, 50),
        Move.new('mop', :damage, 70),
        Move.new('twirl', :stun, 70),
        Move.new('generate', :heal, 50),
      ]
    
    # special moves effects are trippled
    @special_move = SpecialMove.new('bucket', :damage, 25)
    super 32
  end
end
