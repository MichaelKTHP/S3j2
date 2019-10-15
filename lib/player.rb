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


