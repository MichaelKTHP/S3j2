require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !| "

puts "Indique ton nom"
user = HumanPlayer.new(gets.chomp.to_s)

player1 = Player.new("José")
player2 = Player.new("Max")
enemies = [player1, player2]


puts "#{user.name} à #{user.life_points} points de vie"
puts "--------------------"
while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
puts " Quelle action veux-tu effectuer ?

a - chercher une meilleure arme
s - chercher à se soigner 

attaquer un joueur en vue :
0 - Max a #{player2.life_points} points de vie
1 - José a #{player1.life_points} points de vie"
puts "------------------------"

puts "Que souhaites tu faire ?"
input = gets.chomp.to_s
while input != "a" && input !="s" && input != "0" && input !="1" 
puts "Saisie incorrecte"
input = gets.chomp.to_s
end
if input == "a"
user.search_weapon
elsif input == "s"
puts user.search_health_pack
elsif input == "0"
user.attacks(player2)
elsif input == "1"
user.attacks(player1)
end
puts "--------------"

enemies.each do |enemy|
    if enemy.life_points > 0
puts "Les autres joueurs t'attaquent !"    	
enemy.attacks(user)
    end
  end
end
puts "La partie est terminé" 
puts "------------"
if user.life_points > 0 
puts "BRAVO TU ES LE CHAMPION"
end
if user.life_points <= 0 
puts "Tu as perdu"


end




