# <KIDS> The name of this file must be lowercase with underscores and end with ".rb" like my_cool_dude.rb

# <KIDS> You must the filename to main.rb

# <KIDS> The class name must be snake-cased with no spaces.  Replace NewFighterTemplate with something like MyCoolDude
class NewFighterTemplate < Fighter
  def initialize color
    @name = "Replace this with your fighter's name"
    @opening_line = "Replace this with something fun"
    @moves = [
        # add custom moves below
        # moves cannot use more than 100 "points"
        # you can set the following attributes
        #    :hit_chance, :hit_damage, :stun_chance, :heal_amount
        Move.new('powerfull kick', hit_damage: 80), # hit_chance will automatically get set to 20
        Move.new('precise punch', hit_chance: 90), # hit_damage will automatically get set to 10
        Move.new('stunning eye poke', stun_chance: 50), # hit_chance and hit_damage will automatically get set to 25
        Move.new('healing dodge', hit_chance: 50, hit_damage: 25, heal_amount: 25), # heal_amount and stun_chance defaults to 0
      ]
    
    # special moves will be used when your opponent is stunned causing more damage or more healing
    # you can set the following attributes
    #    :hit_damage, :stun_chance, :heal_amount
    @special_move = SpecialMove.new('whirly windup', hit_damage: 80)
    super color
  end
end