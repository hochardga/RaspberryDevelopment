# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class FighterA < Fighter
  def initialize
    @name = "Fighter A"
    @opening_line = "Fighter A"
    @moves = [
      Move.new('hard punch', :damage, 25),
      Move.new('eye poke', :stun, 33),
      Move.new('"I guess I should heal"', :heal, 90),
      Move.new('"I an getting angry!"', :haste, 10),
      Move.new('"Slow down man!"', :slow, 50),
      Move.new('muscle flex', :strengthen, 40),
      Move.new('make fun of', :poison, 80),
      ]
    super
  end
end

class FighterB < Fighter
  def initialize
    @name = "Fighter B"
    @opening_line = "Fighter B"
    @moves = [
        Move.new('stun', :stun, 75)
      ]
    super
  end
end

class FighterC < Fighter
  def initialize
    @name = "Fighter C"
    @opening_line = "Fighter C"
    @moves = [
        Move.new('heal', :heal, 75)
      ]
    super
  end
end

class FighterD < Fighter
  def initialize
    @name = "Fighter D"
    @opening_line = "Fighter D"
    @moves = [
        Move.new('"I an getting angry!"', :haste, 10)
      ]
    super
  end
end

class FighterE < Fighter
  def initialize
    @name = "Fighter E"
    @opening_line = "Fighter E"
    @moves = [
      Move.new('high hit damage', hit_damage: 75),
      Move.new('high hit chance with damage', hit_chance: 75),
      Move.new('high hit chance with stun', hit_chance: 75, stun_chance: 25),
      Move.new('high hit chance with heal', hit_chance: 75, heal_amount: 25),
      ]
    super
  end
end

module Test
  def self.test
    [
      MovesList::BORING_PUNCH.heal_amount == 0,
    ].each_with_index do |test, i|
      raise "FAILED TEST #{i}" unless test
    end


    testing_rounds = 1000
    acceptable_deviation = 0.25
    puts "testing_rounds: #{testing_rounds}   acceptable_deviation: #{acceptable_deviation}"
    [
      [Team.new(FighterA), Team.new(FighterB)],
      [Team.new(FighterA), Team.new(FighterC)],
      [Team.new(FighterA), Team.new(FighterD)],
      [Team.new(FighterA), Team.new(FighterE)],
      [Team.new(FighterB), Team.new(FighterC)],
      [Team.new(FighterB), Team.new(FighterD)],
      [Team.new(FighterB), Team.new(FighterE)],
      [Team.new(FighterC), Team.new(FighterD)],
      [Team.new(FighterC), Team.new(FighterE)],
      [Team.new(FighterD), Team.new(FighterE)],
      [Team.new(FighterA), Team.new(FighterB), Team.new(FighterC), Team.new(FighterD), Team.new(FighterE)],
      [Team.new(FighterA, FighterB), Team.new(FighterC, FighterD), Team.new(FighterE, NewFighterTemplate)],
      [Team.new(FighterA, FighterC), Team.new(FighterD, FighterE), Team.new(NewFighterTemplate, FighterB)],
      [Team.new(FighterA, FighterD), Team.new(FighterE, NewFighterTemplate), Team.new(FighterB, FighterC)],
      [Team.new(FighterA, FighterE), Team.new(NewFighterTemplate, FighterB), Team.new(FighterC, FighterD)],
      [Team.new(FighterA, NewFighterTemplate), Team.new(FighterB, FighterC), Team.new(FighterD, FighterE)],
      [Team.new(Fighter), Team.new(NewFighterTemplate)],
      [Team.new(Fighter), Team.new(Flash)],
      [Team.new(PrincessPeach), Team.new(Bowser)],
      [Team.new(MrsVentrudo), Team.new(FighterA)],
      [Team.new(MrsVentrudo), Team.new(FighterB)],
      [Team.new(MrsVentrudo), Team.new(FighterC)],
      [Team.new(MrsVentrudo), Team.new(FighterD)],
      [Team.new(MrsVentrudo), Team.new(FighterE)],
      [Team.new(MrsVentrudo), Team.new(Flash)],
      [Team.new(MrsVentrudo), Team.new(NewFighterTemplate)],
    ].each do |teams|
      stats = WhoIsBetter.among(teams, fights: testing_rounds, output: false)
      
      average = (testing_rounds.to_f - (stats[:nil] || 0)) / teams.flatten.count
      stats.delete nil

      stats[:_average] = average
      stats[:_low] = average - (average * acceptable_deviation)
      stats[:_high] = average + (average * acceptable_deviation)

      unless stats.values.select do |value|
        value > stats[:_high] ||
        value < stats[:_low]
      end.empty?
        puts "Unballanced ...".yellow
        stats.each do |team, count|
          color = case
            when count.nil?
              puts "   #{team.to_s} : #{count}"
            when [:_average, :_low, :_high].include?(team)
              puts "   #{team.to_s} : #{count}".light_blue
            when count < stats[:_low]
              puts "   #{team.to_s} : #{count}".bold.red
            when count > stats[:_high]
              puts "   #{team.to_s} : #{count}".bold.green
            else
              puts "   #{team.to_s} : #{count}"
          end
        end
      end
    end

    puts "Tests complete".yellow
  end
end