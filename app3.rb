require 'bundler'
require 'pry'
require 'colorize'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/humanplayer'


my_game = Game.new("Dracaufeu")

binding.pry
puts "end of file"