require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("David")
player2 = Player.new("Lulu")



while player1.life_points > 0 && player2.life_points > 0

  puts "Voici l'état de nos joueurs: "
  player1.show_state
  player2.show_state

  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
    if player2.life_points <= 0
    break
    end


  puts "Voici l'état de nos joueurs: "
  player1.show_state
  player2.show_state

  puts "Passons à la phase d'attaque :"
  player2.attacks(player1)
  if player1.life_points <= 0
  break
  end
end



binding.pry
puts "end"