# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class Match
  attr_accessor :teams, :timer

  @@output = true
  def self.output?
    @@output
  end

  def initialize *options
    @teams = []
    @timer = Modifiers::FIGHT_SPEED_MODIFIER

    options.flatten.each do |option|
      case
        when option.is_a?(Team)
          @teams << option
        when !option.is_a?(Hash) && (option == Fighter || option < Fighter)
          @teams << Team.new(option)
        when option.is_a?(Hash)
          @timer = option[:timer] if !option[:timer].nil?
          @@output = option[:output] if !option[:output].nil?        
        else 
          raise "Unsupported option #{option}"
      end
    end

    if @@output
      puts "A new match between ...".bold.yellow 
      @teams.each do |team|
        puts "... TEAM of"
        team.members.each do |member|
          puts "   ... #{member.name_s} '#{member.opening_line_s}'"
        end
      end
    end
  end

  def initialize_old teams_clazzes, timer=Modifiers::FIGHT_SPEED_MODIFIER, output=true
    @teams = teams_clazzes.collect do |team_members_clazzes|
      team_members_clazzes.collect do |member_clazz|
        member_clazz.new
      end
    end

    @timer = timer
    @@output = output

    if @@output
      puts "A new match between ..."
      @teams.each do |team_members|
        puts "... TEAM of"
        team_members.each do |member|
          puts "   ... #{member.name_s} '#{member.opening_line_s}'"
        end
      end
    end
  end

  def fight
    puts "FIGHT!" if @@output
    sleep @timer
    while teams.count > 1
      perform_moves
      
      @teams.each {|team| team.scrum_members }
      @teams.delete_if {|team| team.members.empty? }
    end

    announce_winner
  end

  def perform_moves
    @teams.shuffle.each do |team|
      team.members.shuffle.each do |member|
        opponent_team = (@teams - [team]).sample
        next if opponent_team.nil?

        opponent = opponent_team.members.sample
        next if opponent.nil?

        member.fight opponent
        sleep @timer
      end
    end
  end

  def announce_winner
    winning_team = @teams.first

    if winning_team.nil?
      puts "IT IS A DRAW".yellow.blink if @@output
      return nil
    else
      if @@output
        puts "And the winnder is ... "
        winning_team.members.each do |member|
          puts member.name_s.blink
        end
      end
      return winning_team
    end
  end
end