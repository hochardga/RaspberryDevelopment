# <KIDS> The name of this file must be lowercase with underscores and end with ".rb" like my_cool_dude.rb

# <KIDS> You must the filename to main.rb

# <KIDS> The class name must be snake-cased with no spaces.  Replace NewFighterTemplate with something like MyCoolDude
class NewFighterTemplate < Fighter
  def initialize
    @name = "Replace this with your fighter's name"
    @opening_line = "Replace this with something fun"
    @moves = [
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
      Move.new('hard punch', :damage, 25),
      Move.new('eye poke', :stun, 33),
      Move.new('"I guess I should heal"', :heal, 90),
      Move.new('"I an getting angry!"', :haste, 10),
      Move.new('"Slow down man!"', :slow, 50),
      Move.new('muscle flex', :strengthen, 40),
      Move.new('make fun of', :poison, 80),
    ]
    
    # special moves effects are trippled
    @special_move = SpecialMove.new('whirly windup', :damage, 50)
    super
  end
end