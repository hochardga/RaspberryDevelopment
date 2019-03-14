# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class Match
  attr_accessor :fighter_a, :fighter_b, :timer

  @@output = true
  def self.output?
    @@output
  end

  def initialize fighter_a_clazz, fighter_b_clazz, timer=1, output=true
    @fighter_a = fighter_a_clazz.new 32 #green
    @fighter_b = fighter_b_clazz.new 36 #blue
    @timer = timer
    @@output = output

    if @@output
      puts "A new match between ..."
      puts "   ... #{fighter_a.name_s} '#{fighter_a.opening_line_s}'"
      puts "   and ..."
      puts "   ... #{fighter_b.name_s} '#{fighter_b.opening_line_s}'"
    end
  end

  def fight
    puts "FIGHT!" if @@output
    sleep @timer
    while (@fighter_a.hp > 0) && (@fighter_b.hp > 0)
      @fighter_a.fight @fighter_b
      sleep @timer
      @fighter_b.fight @fighter_a
      sleep @timer
    end
    announce_winner
  end

  def announce_winner
    if @fighter_a.hp == @fighter_b.hp || (@fighter_a.hp < 0 && @fighter_b.hp < 0)
      puts "IT IS A DRAW".yellow.blink if @@output
      return nil
    else
      winning_fighter = [@fighter_a, @fighter_b].max_by(&:hp)
      puts "And the winnder is ... #{winning_fighter.name_s.blink}!" if @@output
      return winning_fighter.class
    end
  end
end