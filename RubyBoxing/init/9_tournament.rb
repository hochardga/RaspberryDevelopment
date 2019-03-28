module Tournament
  def self.begin *options
    @teams = []

    options.flatten.each do |option|
      case
        when option.is_a?(Team)
          @teams << option
        when !option.is_a?(Hash) && (option == Fighter || option < Fighter)
          @teams << Team.new(option)     
        else
          raise "Unsupported option #{option}"
      end
    end

    puts "A tournament amoung".bold.yellow
    @teams.each do |team|
      puts "... TEAM of"
      team.members.each do |member|
        puts "   ... #{member.name_s} '#{member.opening_line_s}'"
      end
    end

    puts ""
    puts "BEGIN".bold.yellow
    puts ""

    round = 1
    while @teams.count > 1
      @teams.each &:generate_members
      puts "ROUND #{round}".yellow.bold
      pairs = @teams.each_slice(2).to_a
      pairs.each do |team_a, team_b|
        next if team_b.nil?
        winning_team = Match.new([team_a, team_b], timer: (Modifiers::FIGHT_SPEED_MODIFIER * 0.25)).fight
        @teams.delete ([team_a, team_b] - [winning_team]).first
        puts ""
        puts "#{winning_team.to_s} advances to the next round!".yellow
        puts ""
      end
      round += 1
    end
    
    puts ""
    puts "The winner of the tournament is #{@teams.first.to_s}".yellow.blink
    puts ""
  end
end