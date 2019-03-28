# Performs many fights to determine who is better by WhoIsBetter.between(Fighter, Fighter)
# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

module WhoIsBetter
  def self.among *options
    stats = {}

    @teams = []
    @fights = 500
    @output = true

    options.flatten.each do |option|
      case
        when option.is_a?(Team)
          @teams << option
        when !option.is_a?(Hash) && (option == Fighter || option < Fighter)
          @teams << Team.new(option)
        when option.is_a?(Hash)
          @fights = option[:fights] if !option[:fights].nil?
          @output = option[:output] if !option[:output].nil?        
        else
          raise "Unsupported option #{option}"
      end
    end

    
    puts "WHO IS BETTER AMONG".bold.yellow if @output
    @teams.each do |team|
      stats[team] = 0
      puts "... TEAM of" if @output
      team.members.each do |member|
        puts "   ... #{member.name_s} '#{member.opening_line_s}'"
      end if @output
    end
    stats[nil] = 0

    @fights.times.each do |i|
      @teams.each &:generate_members
      winning_team = Match.new(@teams, timer: 0, output: false).fight
      stats[winning_team] += 1
    end

    stats.each do |team, count|
      puts "#{team.to_s} : #{count}"
    end if @output

    return stats
  end
end