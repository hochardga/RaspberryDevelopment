# WARNING, YOU SHOULD NOT BE EDITING THIS FILE

class FighterA < Fighter
  def initialize color
    @name = "Fighter A"
    @opening_line = "Fighter A"
    @moves = [
      Move.new('high hit damage', hit_damage: 75)
      ]
    super(color)
  end
end

class FighterB < Fighter
  def initialize color
    @name = "Fighter A"
    @opening_line = "Fighter A"
    @moves = [
        Move.new('high hit chance with damage', hit_chance: 75)
      ]
    super(color)
  end
end

class FighterC < Fighter
  def initialize color
    @name = "Fighter A"
    @opening_line = "Fighter A"
    @moves = [
        Move.new('high hit chance with stun', hit_chance: 75, stun_chance: 25)
      ]
    super(color)
  end
end

class FighterD < Fighter
  def initialize color
    @name = "Fighter A"
    @opening_line = "Fighter A"
    @moves = [
        Move.new('high hit chance with heal', hit_chance: 75, heal_amount: 25)
      ]
    super(color)
  end
end

module Test
  def self.test
    [
      '_move',
      '_moves_list',
      '_fighter',
      '_match',
      # <KIDS> if you create a new fighter file
      # then you must add a line above
    ].each {|file| require_relative file}

    [
      MovesList::BORING_PUNCH.heal_amount == 0
    ].each_with_index do |test, i|
      raise "FAILED TEST #{i}" unless test
    end

    testing_rounds = 1000
    acceptable_deviation = testing_rounds * 0.15
    puts "testing_rounds: #{testing_rounds}   acceptable_deviation: #{acceptable_deviation}"
    [
      [FighterA, FighterB],
      [FighterA, FighterC],
      [FighterA, FighterD],
      [FighterB, FighterC],
      [FighterB, FighterD],
      [FighterC, FighterD],
      [Fighter, NewFighterTemplate],
      [Fighter, Flash],
      [PrincessPeach, Bowser],
    ].each do |fighting_pair|
      stats = WhoIsBetter.between(fighting_pair.first, fighting_pair.last, testing_rounds)
      puts "Unballanced #{stats}".red unless ((stats[fighting_pair.first] - stats[fighting_pair.last]) < acceptable_deviation)
    end

    puts "Tests passed".yellow
  end
end