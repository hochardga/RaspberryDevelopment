# Performs many fights to determine who is better by WhoIsBetter.between(Fighter, Fighter)
# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

module WhoIsBetter
  def self.between teams_clazzes, fights=500, output=true
    stats = {}
    
    puts "= WHO IS BETTER BETWEEN".bold.yellow if output
    teams_clazzes.each do |team_members_clazzes|
      team_members_clazzes.each do |members_clazz|
        stats[members_clazz] = 0
      end
    end
    stats[nil] = 0

    fights.times.each do |i|
      winning_team = Match.new(teams_clazzes, 0, false).fight
      if winning_team.nil? || winning_team.empty?
        stats[nil] += 1
      else
        winning_team.each do |team_member|
          stats[team_member] += 1
        end
      end
    end

    puts stats if output
    return stats
  end
end