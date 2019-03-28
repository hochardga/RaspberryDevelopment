# <KIDS> Use this file to run the program

require_relative('init/_init')

puts "Fighting".yellow
puts "   using the Ruby programming language".yellow
puts ""

teams = []
teams << Team.new(Fighter)
teams << Team.new(Flash)
#teams << Team.new(CaptainFalcon, Ganondorf, Simon)
#teams << Team.new(PrincessPeach, Bowser)
#teams << Team.new(MrsVentrudo, RobertTheJanator)

Match.new(teams).fight
#Match.new(CaptainFalcon, Ganondorf, Simon).fight

#WhoIsBetter.among(CaptainFalcon, Ganondorf, Simon)
#Tournament.begin teams
#Test.test