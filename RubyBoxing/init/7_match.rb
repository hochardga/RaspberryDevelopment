# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class Match
  attr_accessor :teams, :timer

  @@output = true
  def self.output?
    @@output
  end

  def initialize_new *options
    teams_clazzes = []
    @timer = Modifiers::FIGHT_SPEED_MODIFIER
    @output = true

    options.each do |option|
      case 
        when option.is_a?(Fighter)
          teams_clazzes << [option]
        when options.is_a?(Hash) && !option[:timer].nil?
          @timer = option[:timer]
        when options.is_a?(Hash) && !option[:output].nil?
          @timer = option[:output]
        when options.is_a?(Array)
          teams_clazzes << option
        else 
          raise "Unsupported option #{option}"
      end
    end

    teams_clazzes = teams_clazzes.first if teams_clazzes.count == 1
    @teams = teams_clazzes.collect do |team_members_clazzes|
      team_members_clazzes.collect do |member_clazz|
        member_clazz.new
      end
    end

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

  def initialize teams_clazzes, timer=Modifiers::FIGHT_SPEED_MODIFIER, output=true
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
      @teams.each do |team_members|
        team_members.delete_if do |member|
          member.hp < 1
        end
      end
      @teams.delete_if do |team_members|
        team_members.empty?
      end
    end
    announce_winner
  end

  def perform_moves
    @teams.shuffle.each do |team_members|
      team_members.shuffle.each do |member|
        opponent_team = (@teams - team_members).sample
        next if opponent_team.nil?

        opponent = opponent_team.sample
        next if opponent.nil?

        member.fight opponent
        sleep @timer
      end
    end
  end

  def announce_winner
    if @teams.empty?
      puts "IT IS A DRAW".yellow.blink if @@output
      return nil
    else
      if @@output
        puts "And the winnder is ... "
        @teams.first.each do |member|
          puts member.name_s.blink
        end
      end
      return @teams.first.collect &:class
    end
  end
end