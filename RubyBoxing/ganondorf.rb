class Ganondorf < Fighter
  def initialize
    @name = "Calamity Ganon"
    @opening_line = "AHHHHHHHHHHHHH!!!!!!!!!"

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
        Move.new('Sword Slash', :damage, 40),
        Move.new('Phantom Punch', :damage, 50),
        Move.new('Skull Bash', :damage, 23)     
      ]

    # special moves effects are trippled
    @special_move = SpecialMove.new('~ ~ ~ Flame Choke', :poison, 50)
    super
  end
end
