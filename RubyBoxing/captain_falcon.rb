
class CaptainFalcon < Fighter
  def initialize
    @name = "Cap'n Falcon"
    @opening_line = "SHOW ME YA MOVES!"
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
        Move.new('Flaming Fury', :damage, 25),
        Move.new('Blue Falcon', :haste, 75),
        Move.new('Falcon Kick!!', :stun, 90),
    ]

    # special moves effects are trippled
    @special_move = SpecialMove.new('Falcom PUNCH!!', :damage, 50)
    super
  end
end
