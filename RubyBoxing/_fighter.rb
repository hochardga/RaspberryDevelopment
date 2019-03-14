# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class Fighter
  attr_accessor :name, :opening_line, :hp, :moves, :special_move
  attr_accessor :starting_hp, :stun_timer
  attr_accessor :color

  def initialize color
    @color = color
    @stun_timer = 0
    
    @name ||= "Fighter"
    @opening_line ||= "Hi, I am a fighter"

    @hp ||= 25
    @starting_hp = @hp.clone

    @moves ||= []
    @moves << MovesList::BORING_PUNCH

    @special_move ||= SpecialMovesList::WHIRLING_PUNCH
  end

  def name_s
    "#{@name} [#{@hp.ceil}hp]".colorize self.color
  end

  def opening_line_s
    @opening_line.colorize self.color
  end

  def fight other_fighter
    if @stun_timer > 0
      @stun_timer -= 1
      puts "#{self.name_s} is recovering from being stunned." if Match.output?
      return
    end

    move = other_fighter.stun_timer > 0 ? @special_move : @moves.sample
    
    puts "#{self.name_s} trying to do a #{move.title.colorize self.color} ..." if Match.output?
    is_a_hit = rand(1..100) < move.hit_chance
    if is_a_hit
      #puts "   SUCCESS".colorize self.color
      if move.hit_damage > 0
        move_damage = move.hit_damage.to_f / 10
        other_fighter.hp -= move_damage
        puts "   #{move_damage.to_s.colorize self.color} damage to #{other_fighter.name_s}!" if Match.output?
      end

      if move.heal_amount > 0
        heal_amount = move.heal_amount.to_f / 10
        @hp += heal_amount
        @hp = @starting_hp if @hp > @starting_hp
        puts "   #{heal_amount.to_s.colorize self.color} #{'healed'.colorize self.color}!" if Match.output?
      end

      is_a_stun = rand(1..100) < move.stun_chance
      if is_a_stun
        other_fighter.stun_timer = 3
        puts "   AND #{other_fighter.name_s} IS #{'STUNNED'.colorize other_fighter.color}!!!" if Match.output?
      end
    end
  end
end