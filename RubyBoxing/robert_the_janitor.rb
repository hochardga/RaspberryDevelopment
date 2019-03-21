# <KIDS> The name of this file must be lowercase with underscores and end with ".rb" like my_cool_dude.rb

# <KIDS> You must the filename to main.rb

# <KIDS> The class name must be snake-cased with no spaces.  Replace NewFighterTemplate with something like MyCoolDude
class RobertTheJanator < Fighter
  def initialize
    @name = "Robert the Janator"
    @opening_line = "You're going to get moped!"
    @moves = [
        # add custom moves below
        # moves cannot use more than 100 "points"
        # you can set the following attributes
        #    :hit_chance, :hit_damage, :stun_chance, :heal_amount
        Move.new('clean up', hit_chance: 50), # hit_chance will automatically get set to 10
        Move.new('mop', hit_chance: 70), # hit_damage will automatically get set to 15
        Move.new('twirl', stun_chance: 70), # hit_chance and hit_damage will automatically get set to 35
        Move.new('generate', hit_chance: 50, hit_damage: 25, heal_amount: 35), # heal_amount and stun_chance defaults to 0
      ]
    
    # special moves will be used when your opponent is stunned causing more damage or more healing
    # you can set the following attributes
    #    :hit_damage, :stun_chance, :heal_amount
    @special_move = SpecialMove.new('bucket', hit_damage: 70, heal_amount: 25)
    super 32
  end
end
