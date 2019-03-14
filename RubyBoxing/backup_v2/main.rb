# <KIDS> Use this file to run the program
require_relative '_colorize'

puts "Fighting".yellow
puts "   using the Ruby programming language".yellow
puts ""

['_move', '_special_move', '_moves_list', '_special_moves_list', '_fighter', '_match', '_test', '_tournament', '_who_is_better'].each {|file| require_relative file}

[
  'new_fighter_template',
  'bowser',
  'flash',
  'princess_peach',
  # <KIDS> if you create a new fighter file
  # then you must add a line above
].each {|file| require_relative file}

# <KIDS> Edit the line below to change who is fighting who
# EXAMPLE: Match.new(Fighter, Fighter).fight

Match.new(Fighter, Fighter).fight

#Test.test
#WhoIsBetter.between Fighter, Flash
#Tournament.begin Fighter, PrincessPeach, Bowser, Flash, NewFighterTemplate