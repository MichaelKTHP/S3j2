require "pry"

class Player
attr_accessor :name
attr_accessor :life_points

def initialize(name_to_save,life_points_to_save =10)
@name = name_to_save
@life_points = life_points_to_save
end

def show_state
puts "#{@name} a #{@life_points} points de vie"
end

def gets_damage(damage)
@life_points = @life_points - damage
end

def attacks(player)
puts "Le joueur #{@name} attaque le joueur #{player.name}"
damage_dealt = compute_damage
player.gets_damage(damage_dealt)
puts "Il lui inflige #{damage_dealt} point de dégats " 
if player.life_points <= 0 
puts ("#{player.name} à été tué")
end

end

 def compute_damage
 return rand(1..6)
 end

end

class HumanPlayer < Player
attr_accessor :weapon_level
def initialize(name_to_save,life_points_to_save =100,weapon_level_to_save=1)
@weapon_level = weapon_level_to_save

super(name_to_save,life_points_to_save=100)
  end

def show_state
puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

def compute_damage
    rand(1..6) * @weapon_level
  end

def search_weapon
 dice_result = rand(1..6)
 puts "Tu as trouvé une arme de niveau #{dice_result}"
    if dice_result > @weapon_level
 @weapon_level = dice_result
    
  else
    puts "Elle n'est pas mieux que ton arme actuelle"
    end
  end

def search_health_pack
	if @life_points == 100
		return "Ta vie est déjà au maximum"
	else

	
    dice_result = rand(1..6)
    if dice_result == 1
      return "Tu n'as rien trouvé"
    end
    if dice_result == 2 || dice_result == 3 || dice_result == 4 || dice_result == 5 
    i = 0
    50.times do 
    	  @life_points = @life_points + 1
          puts "+1"
          i = i+1
          break if @life_points == 100
         
      end
       return "Tu as regagné #{i} points de vie"
 end
    if dice_result == 6
    i = 0
    80.times do 
    	  @life_points = @life_points + 1
          puts "+1"
          i = i+1
          break if @life_points == 100
          
      end
      return "Tu as regagné #{i} points de vie"
    end
       end
          end
end
 
player1 = Player.new("José")
player2 = Player.new("Max")
player3 = HumanPlayer.new("Juan")







