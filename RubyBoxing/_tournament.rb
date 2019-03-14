module Tournament
  def self.begin *fighters
    puts "A tournament amoung #{fighters}".yellow
    round = 1
    while fighters.count > 1
      puts "ROUND #{round}".yellow
      pairs = fighters.each_slice(2).to_a
      pairs.each do |fighter_a, fighter_b|
        next if fighter_b.nil?
        winning_fighter = Match.new(fighter_a, fighter_b, 0.25).fight
        fighters.delete ([fighter_a, fighter_b] - [winning_fighter]).first
        puts ""
        puts "#{winning_fighter} advances to the next round!".yellow
        puts ""
      end
      round += 1
    end
    puts "The winner of the tournament is #{fighters.first}".yellow.blink
  end
end