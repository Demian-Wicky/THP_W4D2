require 'bundler'
require 'pry'
require 'colorize'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/humanplayer'



####### INTRO ########################
system ('clear')
puts
puts "╔═════════════════════════════════════════════════════╗".blue
puts "║".blue + "    Bienvenue sur 'ILS VEULENT TOUS MA POO' ! V.3    ".green + "║".blue
puts "║".blue + " ⓘ".yellow + "  Le but du jeu est d'être le dernier survivant !  ".yellow + "║".blue
puts "╚═════════════════════════════════════════════════════╝".blue
puts

####### GAME_INIT ####################
puts "Salut à toi, jeune entrepreneur !"
puts "Quel est ton prénom ?"
print "> "
name = gets.chomp
my_game = Game.new(name)

####### GAMEPLAY #####################
while my_game.is_still_ongoing?
  system ('clear')
  my_game.show_players
  my_game.menu
  print "> "
  input = gets.chomp
  my_game.menu_choice(input)
  gets
  system ('clear')
  my_game.enemies_attack
end
my_game.end