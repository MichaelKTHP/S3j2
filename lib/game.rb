require "pry"
require_relative 'player'

class Game
attr_accessor :human_player
attr_accessor :enemies

  def initialize(human_name)
    
    @human_player = HumanPlayer.new(human_name)
    player1 = Player.new("José")
    player2 = Player.new("Max")
    player3 = Player.new("Pedro")
    player4 = Player.new("Juan")
    @enemies = [player1,player2,player3,player4]
   

  end
   
  def kill_player(player)
  #.name est le nom du player (voir fichier player.rb)
  return @enemies = @enemies.select { |e| e.name != player  }
  end

  def enemies_attack 
    @enemies.each do |enemy|
    enemy.attacks(@human_player)
      end
  end

  def is_still_ongoing?
  	if @human_player.life_points > 0 && @enemies.length >= 1
  	return true
  	else 
  	return false
  end
    
  end

  def show_players
  	puts "#{@human_player.show_state}"
  	  
      puts "Il reste #{@enemies.length} ennemis en jeu"
    
  end

  def menu
  	 puts " Voici les actions possibles :

a - chercher une meilleure arme
s - chercher à se soigner 

attaquer un joueur en vue : "

    @enemies.each do |enemy|
puts " #{@enemies.index { |x| x == enemy }} - #{enemy.name} à #{enemy.life_points} points de vie" 
     
    end
    
  end

  def menu_choice

  puts "Quelle action veux-tu effectuer ?"
  	
  input = gets.chomp.to_s
    while input != "a" && input !="s" && input != "0" && input !="1"  && input != "2" && input !="3"
puts "Saisie incorrecte"
input = gets.chomp.to_s
    end
  if input == "a"
  @human_player.search_weapon
  elsif input == "s"
  puts @human_player.search_health_pack
  elsif input == "0"
  @human_player.attacks(@enemies[0])
  self.kill_player(@enemies[0].name) if @enemies[0].life_points <= 0
  elsif input == "1"
  @human_player.attacks(@enemies[1])
  self.kill_player(@enemies[1].name) if @enemies[1].life_points <= 0
  elsif input == "2"
  @human_player.attacks(@enemies[2])
  self.kill_player(@enemies[2].name) if @enemies[2].life_points <= 0
  elsif input == "3"
  @human_player.attacks(@enemies[3])
  self.kill_player(@enemies[3].name) if @enemies[3].life_points <= 0
  end
end

  
  
  def end_game
  puts "La partie est terminé" 
  puts "------------"
    if @human_player.life_points > 0 
    puts "BRAVO TU ES LE CHAMPION"
    end
    if @human_player.life_points <= 0 
    puts "Tu as perdu"
    end
  end  
end
