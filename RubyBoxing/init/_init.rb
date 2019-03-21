init_files = Dir["init/*.rb"].sort
init_files.delete 'init/_init.rb'
init_files.each {|file| require_relative file.gsub 'init/', '' }

files = Dir["*.rb"]
files.delete 'main.rb'
files.delete '_test_runner.rb'
files.each {|file| require_relative "../#{file}"}