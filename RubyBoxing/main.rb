# <KIDS> Use this file to run the program

require_relative('init/_init')

puts "Fighting".yellow
puts "   using the Ruby programming language".yellow
puts ""

# <KIDS> Edit the line below to change who is fighting who

teams = []
teams << [Fighter]
teams << [Flash]
#teams << [PrincessPeach, Bowser]
#teams << [MrsVentrudo, RobertTheJanator]

Match.new(teams).fight

#WhoIsBetter.between teams
#Test.test