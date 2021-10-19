
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'





puts "|-------------------------------------------------|
|       Bienvenue sur 'TU meurs ou pas !?' !      |
|Le but du jeu est de casser la gueule aux autres!|
|-------------------------------------------------|"
  puts"===================================================\n\n"    
      
  puts "Création de ton joueur ! \n\n"
  
  puts"========================\n\n"

  puts "Quel est le nom de ton joueur ?\n"

  print "--> "
  name1 = gets.chomp
  puts "#{name1}, c'est pas très beau mais continuons \n\n"
  player1 = HumanPlayer.new(name1)

  puts"========================\n\n"
  
  Romu = Player.new("Romu")
  Quentin = Player.new("Quentin")
  ennemies = [Romu, Quentin]







  while player1.life_points >0 && (Romu.life_points > 0 || Quentin.life_points >0)
    puts "\n\n"





    puts "Voici l'état des joueurs: "
    
    if player1.life_points > 0 
        puts player1.show_state
    else puts "#{player1} est mort "
    end
    ennemies.each_with_index do |bot, index|
        if bot.life_points > 0 
        puts "#{bot.show_state} "
        else
            puts "#{bot.name} est mort "
        end
    end





   
    puts "\n\n"
    puts"=============================\n\n"

    puts "Quelle action veux-tu effectuer ?\n"
    puts "a --> chercher une meilleure arme.\n"
    puts "s --> chercher a se soigner.\n\n"
    puts"=============================\n\n"



    puts "Attaquer un joueur en vue: "

        ennemies.each_with_index do |bot, index|
        if bot.life_points > 0
        puts "#{index} --> attaquer #{bot.name} qui a #{bot.life_points} points de vie."
        else
        puts "#{index} --> impossible d'attaquer #{bot.name}, qui est mort comme une merde ! "
        end

    end

    puts "\n\n"


    puts "Quel est ton choix #{player1.name} ? \n"
    print "--> "
    choice = gets.chomp
    puts "\n\n"
    puts "Phase de Combat : \n\n"

   
    if choice == "a"
        player1.search_weapon
        
      elsif choice == "s"
        player1.search_health_pack


      elsif choice == "1" 
          if Quentin.life_points > 0
          player1.attacks(Quentin)
          else
          puts "#{Quentin.name} est mort."
          end
        
        
      elsif choice == "0"
        if Romu.life_points > 0
            player1.attacks(Romu)
            puts "\n\n"
        else
            puts "#{Romu.name} est mort."
        end

      else
        "Erreur"
    end

      ennemies.each do |bot|
        if bot.life_points > 0
         bot.attacks(player1)
         puts "\n\n"
        end
      end

                                                
  end        
        

  if player1.life_points == 0 
    puts "#{player1.name} tu es vraiment trop nul de perdre contre deux bots qui tape de 1 à 6 alors que tu as 100 points de vie et des armes.."
  elsif Quentin.life_points < 1 && Romu.life_points < 1
    puts "#{player1.name} t'es chaud bg ! "
  end


binding.pry
puts "end"