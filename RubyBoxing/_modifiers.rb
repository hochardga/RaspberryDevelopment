module Modifiers

  # This is the starting HP of fighers.
  # Default value is 25.
  # Increasing this makes the matches last longer.
  STARTING_HP = 25

  # This is how many rounds a fighter will be stunned for.
  # Default value is 3.
  # Increasing this makes stun more effective
  STUN_ROUNDS = 3

  # This affects how much damage a move will do.
  # Default value is 0.10
  # So a Move with damage_amount of 50, will do 5 damage
  DAMAGE_MODIFIER = 0.10

  # This affects how much HP a move will heal
  # Default value is 0.10
  # So a Move with heal_amount of 50, will do heal 5 HP
  HEAL_MODIFIER = 0.10

  # This affects if a move hits
  # Default value is 1
  HIT_CHANCE_MODIFIER = 1

  # This affects if a move stuns
  # Default value is 1
  STUN_CHANCE_MODIFIER = 1

  # Every fighter will have this list of moves
  DEFAULT_MOVES = [MovesList::BORING_PUNCH]

  # This is the fault special move if not declared
  DEFAULT_SPECIAL_MOVES = SpecialMovesList::BOOM

  # This affects how fast a fight is.
  # Default value is 1
  # Increasing this SLOWS a fight down.
  # Decreasing this SPEEDS up a fight
  FIGHT_SPEED_MODIFIER = 1
end