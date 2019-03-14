class Ganondorf < Fighter
  def initialize color
    @name = "Calamity Ganon"
    @opening_line = "AHHHHHHHHHHHHH!!!!!!!!!"
    @moves = [
        Move.new('Sword Slash', hit_damage: 75),
        Move.new('Phantom Punch', hit_damage: 50),
        Move.new('Skull Bash', hit_damage: 77)
      ]
    super(color)
  end
end
