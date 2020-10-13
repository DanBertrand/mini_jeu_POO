require "pry"
require 'bundler'
Bundler.require


class Player

	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		puts "#{@name} has #{@life_points} life points"
	end

	def gets_damaged(n)
		@life_points -= n
		if @life_points <= 0
			puts "The player #{name} has been  killed"
		end
	end

	def compute_damage
	  return rand(1..6)
	end

	def attacks(player)
		puts "#{name} attacks #{player.name}"
		damage = compute_damage
		puts "It inflicts #{damage} points of damage"
		player.gets_damaged(damage)
	end


end


