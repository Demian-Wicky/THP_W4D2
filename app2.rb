require 'bundler'
require 'pry'
require 'colorize'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/humanplayer'

  ######## SEED ####################
  player1 = Player.new("José")
  player2 = Player.new("Josiane")
  enemies = [player1, player2]
  ##################################

  ####### INTRO ####################
  system ('clear')
  puts
  puts "╔═════════════════════════════════════════════════════╗".blue
  puts "║".blue + "      Bienvenue sur 'ILS VEULENT TOUS MA POO' !      ".green + "║".blue
  puts "║".blue + " ⓘ".yellow + "  Le but du jeu est d'être le dernier survivant !  ".yellow + "║".blue
  puts "╚═════════════════════════════════════════════════════╝".blue
  puts
  ##################################

  ####### CREATE PLAYER ############
  puts "Salut à toi, jeune entrepreneur !"
  puts "Quel est ton prénom ?"
  print "> "
  name = gets.chomp
  humanplayer = HumanPlayer.new(name)
  ##################################

  ####### menu #####################
  def menu(player1, player2)
    puts "Quelle action veux-tu effectuer ?"
    puts
    puts "a - ".blue + "Chercher une meilleure arme."
    puts "s - ".blue + "Chercher à se soigner."
    puts
    puts "Attaquer un joueur en vue :".red
    print "0 - ".red
    print "#{player1.show_state}"
    print "1 - ".red
    print "#{player2.show_state}"
    puts
    print "> "
    user_input = gets.chomp.to_s
  end
  ##################################

  ####### BATTLE ###################
  while humanplayer.is_alive? && (player1.is_alive? || player2.is_alive?)

    puts
    system ('clear')
    humanplayer.show_state

    case menu(player1, player2)
    when "a"
      system ('clear')
      humanplayer.search_weapon
      gets
    when "s"
      system ('clear')
      humanplayer.search_health_pack
      gets
    when "0"
      system ('clear')
      humanplayer.attacks(player1)
      gets
    when "1"
      system ('clear')
      humanplayer.attacks(player2)
      gets
    end

    puts "Les autres joueurs t'attaquent !" if (player1.is_alive? || player2.is_alive?)
    enemies.each do |enemy|
      if enemy.is_alive?
      enemy.attacks(humanplayer)
      gets
      end
    end

  end
  ##################################

  ####### END ######################
  puts "La partie est finie"
  if humanplayer.is_alive?
    puts "BRAVO ! Tu as Gagné !".yellow
  else
    puts "Loser ! Tu as perdu !".blue
  end
  ##################################



# binding.pry
# puts "end of file"