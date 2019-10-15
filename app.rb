require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("José")
player2 = Player.new("Max")

puts "Voici l'état de chaque joueur : "
while player1.life_points > 0 && player2.life_points > 0
puts "#{player1.name} à #{player1.life_points} points de vie"
puts "#{player2.name} à #{player2.life_points} points de vie"
puts "Passons à la phase d'attaque ! "
puts "---------------------------------------"
player2.attacks(player1)
if player1.life_points <= 0 
break
end
puts "--------------------------------------- "
player1.attacks(player2)
puts "---------------------------------------"
end

binding.pry