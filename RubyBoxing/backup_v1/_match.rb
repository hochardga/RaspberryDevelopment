# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class Match
  attr_accessor :boxer_a, :boxer_b
  
  def initialize boxer_a_clazz, boxer_b_clazz
    self.boxer_a = boxer_a_clazz.new
    self.boxer_b = boxer_b_clazz.new

    if boxer_a.name == boxer_b.name
      boxer_a.name = "#{boxer_a.name} A"
      boxer_b.name = "#{boxer_b.name} B"
    end

    puts "A new match between ..."
    puts "   ... #{boxer_a.name} '#{boxer_a.opening_line}'"
    puts "   and ..."
    puts "   ... #{boxer_b.name} '#{boxer_b.opening_line}'"
  end

  def fight
    puts "FIGHT!"
    sleep 1
    while (@boxer_a.hp > 0) && (@boxer_b.hp > 0)
      @boxer_a.fight @boxer_b
      sleep 1
      @boxer_b.fight @boxer_a
      sleep 1
    end
    announce_winner
  end

  def announce_winner
    puts "And the winnder is ..."
    puts [@boxer_a, @boxer_b].max_by(&:hp).name
  end
end