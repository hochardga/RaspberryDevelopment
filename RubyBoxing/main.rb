# <KIDS> Use this file to run the program

puts "Boxing"
puts "   using the Ruby programming language"

[
  '_move',
  '_boxer',
  '_match',
  'boxer_flash', # <KIDS> if you create a new boxer file you must add a line here
  'boxer_joe_puncher', # <KIDS> if you create a new boxer file you must add a line here
].each {|file| require_relative file}

# <KIDS> Edit the line below to change who is boxing who
# <KIDS> The line should read something like
Match.new(Boxer, Boxer).fight
#Match.new(Boxer, BoxerJoePuncher).fight