class Player

    #Constante
@@all_player=[]

attr_accessor :name, :life_points


def initialize(name, life_points = 10)     

@name = name
@life_points = 10

end

def show_state

puts "#{@name} a #{@life_points} points de vie."

end

def gets_damage(damage_received)

@life_points -= damage_received  

if @life_points <= 0                                #Regarde si les pv sont égal à 0
puts "#{name} a été tué."
end

end

def attacks(player) 
damage = compute_damage
puts "le joueur #{@name} attaque le joueur #{player.name}."    #Un joueur lance une attaque
if damage > 4
puts "#{@name} défouraille #{player.name}, il lui inflige #{damage} points de dégats."
else  
puts "Il lui inflige #{damage} points de dégats."

end
player.gets_damage(damage)
end

def compute_damage

return rand(1..6)

end
end

class HumanPlayer < Player



attr_accessor :weapon_level

def initialize(name, life_points = 100)

super(name) #fait appel au initialize de la classe Event

@weapon_level = 1 # j'ai rajouté cette ligne
@life_points = 100
end


def show_state
puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."

end

def compute_damage
rand(1..6) * @weapon_level
end

def search_weapon 
level_weapon = rand(1..6)
puts "Tu a trouvé une arme level #{level_weapon}"
if level_weapon >= @weapon_level 
@weapon_level = level_weapon
puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
else
puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
end
end

def search_health_pack
health_pack = rand(1..6) 
puts "tu as trouvé un pack de soin level #{health_pack}"       
if health_pack == 1
puts "tu n'as rien trouvé, +0 points de vie dommage =( !"
elsif health_pack == 6
@life_points += 80
puts "tu as trouvé un pack de +80 points de vie, cool =D !"
else 
@life_points += 50
puts "Bravo, tu as trouvé un pack de +50 points de vie, tu vas mieux ;) !"
end
if @life_points > 100 
@life_points = 100
end
end


end


