require 'bundler'
require 'pry'
require 'colorize'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def perform
  ######## SEED ####################
  player1 = Player.new("Pikachu")
  player2 = Player.new("Smogogo")
  ##################################

  ####### INTRO ####################
  puts
  puts "À ma droite Josiane !".blue
  puts "À ma gauche José !".blue
  puts
  puts "Voici l'état de chaque joueur :".yellow
  print "#{player1.show_state}"
  print "#{player2.show_state}"
  puts
  puts "FIGHT !!".red
  puts
  ##################################

  ####### BATTLE ###################
  while player1.is_alive? && player2.is_alive?
    puts
    puts "Voici l'état de nos joueurs :".yellow
    print player1.show_state
    print player2.show_state
    puts
    player1.attacks(player2)
    player2.show_state
    break if player2.is_dead?
    player2.attacks(player1)
    player1.show_state
  end
  ##################################
end

perform

