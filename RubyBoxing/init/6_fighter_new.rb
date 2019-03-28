# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class Fighter
  attr_accessor :name, :opening_line, :hp, :moves, :special_move
  attr_accessor :starting_hp
  attr_accessor :stun_timer, :haste_timer, :slow_timer, :strengthen_timer, :poison_timer
  attr_accessor :color

  def initialize color = nil
    @color = color || (31..36).to_a.sample
    @stun_timer = 0
    @haste_timer = 0
    @slow_timer = 0
    @strengthen_timer = 0
    @poison_timer = 0
    
    @name ||= "Fighter"
    @opening_line ||= "Hi, I am a fighter"

    @hp ||= Modifiers::STARTING_HP
    @starting_hp = @hp

    @moves ||= []
    @moves = @moves + Modifiers::DEFAULT_MOVES
    @special_move ||= Modifiers::DEFAULT_SPECIAL_MOVES
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
      puts "#{self.name_s} is recovering from being stunned.  #{@stun_timer} more rounds." if Match.output?
      return
    end

    perform_move other_fighter

    if @slow_timer > 0
      puts "   Slowed for #{@slow_timer} more rounds." if Match.output?
      @slow_timer -= 1
    end

    if @haste_timer > 0
      puts "   Hasted for #{@haste_timer} more rounds." if Match.output?
      perform_move other_fighter
      @haste_timer -= 1
    end

    if @strengthen_timer > 0
      puts "   Strengthened for #{@strengthen_timer} more rounds." if Match.output?
      @strengthen_timer -= 1
    end

    if @poison_timer > 0
      puts "   Poisoned for #{@poison_timer} more rounds." if Match.output?
      @poison_timer -= 1
    end
  end

  def perform_move other_fighter
    move = other_fighter.stun_timer > 0 ? @special_move : @moves.sample
    puts "#{self.name_s} trying to do a #{move.title.colorize self.color} ..." if Match.output?
    move.handle_move self, other_fighter
  end
end