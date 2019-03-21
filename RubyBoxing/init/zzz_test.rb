# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class FighterA < Fighter
  def initialize
    @name = "Fighter A"
    @opening_line = "Fighter A"
    @moves = [
      Move.new('high hit damage', hit_damage: 75)
      ]
    super
  end
end

class FighterB < Fighter
  def initialize
    @name = "Fighter B"
    @opening_line = "Fighter B"
    @moves = [
        Move.new('high hit chance with damage', hit_chance: 75)
      ]
    super
  end
end

class FighterC < Fighter
  def initialize
    @name = "Fighter C"
    @opening_line = "Fighter C"
    @moves = [
        Move.new('high hit chance with stun', hit_chance: 75, stun_chance: 25)
      ]
    super
  end
end

class FighterD < Fighter
  def initialize
    @name = "Fighter D"
    @opening_line = "Fighter D"
    @moves = [
        Move.new('high hit chance with heal', hit_chance: 75, heal_amount: 25)
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
      #Match.new(FighterA, FighterB, FighterC).nil?,
      #Match.new([FighterA, FighterB, FighterC]).nil?,
      #Match.new([FighterA], [FighterB], [FighterC]).nil?,
      #Match.new(FighterA, [FighterB, FighterC]).nil?,
    ].each_with_index do |test, i|
      raise "FAILED TEST #{i}" unless test
    end

    #Match.new([[FighterA], [FighterD]], 0).fight
    #return

    testing_rounds = 1000
    acceptable_deviation = 0.25
    puts "testing_rounds: #{testing_rounds}   acceptable_deviation: #{acceptable_deviation}"
    [
      [[FighterA], [FighterB]],
      [[FighterA], [FighterC]],
      [[FighterA], [FighterD]],
      [[FighterA], [FighterE]],
      [[FighterB], [FighterC]],
      [[FighterB], [FighterD]],
      [[FighterB], [FighterE]],
      [[FighterC], [FighterD]],
      [[FighterC], [FighterE]],
      [[FighterD], [FighterE]],
      [[FighterA], [FighterB], [FighterC], [FighterD], [FighterE]],
      [[FighterA, FighterB], [FighterC, FighterD], [FighterE, NewFighterTemplate]],
      [[FighterA, FighterC], [FighterD, FighterE], [NewFighterTemplate, FighterB]],
      [[FighterA, FighterD], [FighterE, NewFighterTemplate], [FighterB, FighterC]],
      [[FighterA, FighterE], [NewFighterTemplate, FighterB], [FighterC, FighterD]],
      [[FighterA, NewFighterTemplate], [FighterB, FighterC], [FighterD, FighterE]],
      [[Fighter], [NewFighterTemplate]],
      [[Fighter], [Flash]],
      [[PrincessPeach], [Bowser]],
      [[MrsVentrudo], [FighterA]],
      [[MrsVentrudo], [FighterB]],
      [[MrsVentrudo], [FighterC]],
      [[MrsVentrudo], [FighterD]],
      [[MrsVentrudo], [FighterE]],
      [[MrsVentrudo], [Flash]],
      [[MrsVentrudo], [NewFighterTemplate]],
    ].each do |teams|
      stats = WhoIsBetter.between(teams, testing_rounds, false)
      
      average = (testing_rounds.to_f - (stats[:nil] || 0)) / teams.flatten.count
      stats.delete nil

      stats[:_average] = average
      stats[:_low] = average - (average * acceptable_deviation)
      stats[:_high] = average + (average * acceptable_deviation)

      unless stats.values.select do |value|
        value > stats[:_high] ||
        value < stats[:_low]
      end.empty?
        puts "Unballanced #{teams} ...".yellow 
        puts "#{stats}".red 
      end
    end

    puts "Tests passed".yellow
  end
end