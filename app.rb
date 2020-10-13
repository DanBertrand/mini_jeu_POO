require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josiane")
player2 = Player.new("José")


while player1.life_points > 0 && player2.life_points > 0 
	puts "Here is the state of both players:"
	player1.show_state 
	player2.show_state
	gets.chomp
	puts "*********** FIGHT ! ************"
	gets.chomp
	player1.attacks(player2)
	gets.chomp
	player2.attacks(player1)
end

















