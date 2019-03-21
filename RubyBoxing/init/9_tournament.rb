module Tournament
  def self.begin teams
    puts "A tournament amoung #{teams}".yellow

    round = 1
    while teams.count > 1
      puts "ROUND #{round}".yellow
      pairs = teams.each_slice(2).to_a
      pairs.each do |team_a, team_b|
        next if team_b.nil?
        winning_team = Match.new([team_a, team_b], 0.25).fight
        teams.delete ([team_a, team_b] - [winning_team]).first
        puts ""
        puts "#{winning_team} advances to the next round!".yellow
        puts ""
      end
      round += 1
    end
    puts "The winner of the tournament is #{teams.first}".yellow.blink
  end
end