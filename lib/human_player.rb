require "pry"
require 'bundler'
Bundler.require


class HumanPlayer

	attr_accessor :name, :life_points, :weapon_level

    def initialize(name)
		@name = name
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		puts "#{@name} has #{@life_points} life points and a weapon level #{@weapon_level}"
	end

	def gets_damaged(n)
		@life_points -= n
		if @life_points <= 0
			puts "The player #{name} has been  killed"
		end
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end

	def attacks(player)
		puts "#{name} attacks #{player.name}"
		damage = compute_damage
		puts "It inflicts #{damage} points of damage"
		player.gets_damaged(damage)
	end

	def search_weapon
		new_weapon = rand(1..6)
		puts "You found a weapon level #{new_weapon}"
		if new_weapon > @weapon_level
			@weapon_level = new_weapon
			puts "You found a weapon causing bigger damages. Let's get into the bloodshed !!"
		else 
			@weapon_level = @weapon_level
			puts "This weapon is sucks.. try again later." 
		end
	end

	def search_health_pack
		health_pack = rand(1..6)
		if health_pack == 1
			puts "Didn't find anything ..."
		elsif 2 <= health_pack && health_pack <= 5
			if @life_points <= 50
			   @life_points += 50
			   puts "Nice, you found a health pack of 50 life points"
			else  
				@life_points = 100
				puts "Nice, you found a health pack of 50 life points"
			end
		elsif health_pack == 6
			if @life_points <= 20
			   @life_points += 80
			   puts "Nice, you found a health pack of 80 life points"
			else  @life_points = 100
				puts "Nice, you found a health pack of 80 life points"
			end	
		end	
	end

end


