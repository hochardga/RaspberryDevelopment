module MovesList
  #BORING_PUNCH = Move.new 'boring punch', hit_chance: 75
  BORING_PUNCH = Move.new('boring punch', EFFECT_TYPES::DAMAGE, 75)
end