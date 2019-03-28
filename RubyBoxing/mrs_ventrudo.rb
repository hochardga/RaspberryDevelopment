class MrsVentrudo < Fighter
  def initialize
    @name = "Mrs. Ventrudo"
    @opening_line = "~ ~ ~ whistle ~ ~ ~"
    @moves = [
        Move.new('staring gaze', EFFECT_TYPES::STUN, 50),
        Move.new('load whistle', EFFECT_TYPES::DAMAGE, 25),
        Move.new('teaching lesson', EFFECT_TYPES::HEAL, 75),
      ]
    
    @special_move = SpecialMove.new 'ABOVE AND BEYOND', EFFECT_TYPES::DAMAGE, 10
    super
  end
end