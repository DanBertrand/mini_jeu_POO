require 'bundler'
Bundler.require


require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'


puts "***********************************************************"
puts "************* WELCOME TO THE NEW GAME *********************"
puts "**************   Shot or get shot   ***********************"
puts "***********************************************************"
puts "********   One Rule : BE THE LAST SURVIVOR   **************"
puts "*********************************************************** \n \n"


puts "What is your name ?"
print "> " 
user_name = gets.chomp
human_player = HumanPlayer.new("#{user_name}")

puts "Your player has been succesfully created" 
puts human_player.show_state
puts "******************************************"


puts gets.chomp


enemies= []
player2 = Player.new("Josiane")
player3 = Player.new("José")
enemies = [player2, player3]


while human_player.life_points > 0 && (player2.life_points > 0 || player3.life_points > 0)
	puts human_player.show_state
	puts "**********What do you wanna do ?***********\n \n \n" 
	puts "w - look for a better weapon"
	puts "h - look for a health pack \n \n \n"
	puts "Attack a player \n \n"
	print "1 - "
	puts player2.show_state
	print "2 - "
	puts player3.show_state
	puts "********************************************\n \n \n"


	choice = gets.chomp

		if choice == "w"
			puts human_player.search_weapon
		elsif choice == "h"
			puts human_player.search_health_pack
		elsif choice == "1"
			puts human_player.attacks(player2)
		elsif choice == "2"
			puts human_player.attacks(player3)	
		else
			puts "????????  Didn't understand your move ????????"
		end

	puts "****************************"
	puts "The enemies attack now !"
	gets.chomp

		if player2.life_points > 0 && player3.life_points > 0
			puts player2.attacks(human_player)
			puts player3.attacks(human_player)

		elsif player2.life_points <= 0 && player3.life_points > 0
			player3.attacks(human_player)

		elsif player3.life_points <= 0 && player2.life_points > 0
			player2.attacks(human_player)

		end


end


puts "Game Over ..."

	if human_player.life_points > 0
	puts "Well done ! You win!"
	else
	puts "You suck. Go string some beads "
	end