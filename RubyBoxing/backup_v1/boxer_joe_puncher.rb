class BoxerJoePuncher < Boxer
  def initialize
    @name = "Joe Puncher"
    @opening_line = "I like to punch a lot"
    @moves = [
        # <KIDS> look here
        #    when creating a new move, you can set
        #       :hit_chance, :hit_damage, or :stun_chance
        #    try "uncommenting out" some of the lines below by removing "#"
        Move.new('precision punch', hit_chance: 90),
        Move.new('stunning punch', stun_chance: 90),
        Move.new('powerfull punch', hit_damage: 90),
        Move.new('hook', hit_chance: 33, stun_chance: 33, hit_damage: 33),
      ]
    super()
  end
end