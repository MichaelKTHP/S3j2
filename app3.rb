require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !| "

puts "Indique ton nom"
my_game = Game.new(gets.chomp.to_s) 
puts "----------------------"
while my_game.is_still_ongoing? ==true
my_game.show_players
puts "------------------"

my_game.menu
my_game.menu_choice
my_game.enemies_attack 
end

my_game.end_game








