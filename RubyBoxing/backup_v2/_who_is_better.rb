# Performs many fights to determine who is better by WhoIsBetter.between(Fighter, Fighter)
# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

module WhoIsBetter
  def self.between fighter_a, fighter_b, fights=500, output=false
    puts "= WHO IS BETTER BETWEEN -#{fighter_a}- AND -#{fighter_b}-".bold.yellow

    stats = {fighter_a => 0, fighter_b => 0, nil => 0}
    fights.times.each do |i|
      winning_fighter = Match.new(fighter_a, fighter_b, 0, false).fight
      stats[winning_fighter] += 1
    end

    puts stats
    return stats
  end
end