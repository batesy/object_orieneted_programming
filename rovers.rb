class Rover
	attr_accessor(:x, :y, :orientation, :instructions)
	def initialize(x, y, orientation, instructions)
		@x = x
		@y = y
		@orientation = orientation
		@instructions = instructions
	end

	def move
		if @orientation == 'N'
			@y += 1
		elsif @orientation == 'S'
			@y -= 1
		elsif @orientation == 'E'
			@x += 1
		elsif @orientation == 'W'
			@x -= 1
		end
	end

	def turn(direction)
		if    @orientation == 'N' && direction == "L" then @orientation = "W"
		elsif @orientation == 'N' && direction == "R" then @orientation = "E"
		elsif @orientation == 'E' && direction == "L" then @orientation = "N"
		elsif @orientation == 'E' && direction == "R" then @orientation = "S"
		elsif @orientation == 'S' && direction == "L" then @orientation = "E"
		elsif @orientation == 'S' && direction == "R" then @orientation = "W"
		elsif @orientation == 'W' && direction == "L" then @orientation = "S"
		elsif @orientation == 'W' && direction == "R" then @orientation = "N"
		end
	end

	def navigation
		@instructions.each_char { |i| 
      if    i == "M" then move
      elsif i == "L" then turn("L")
      elsif i == "R" then turn("R")
      end	
		}
		puts "Coordinates: #{x}, #{y}, #{orientation}."	  
	end

end

rover = Rover.new(1, 2, 'N', 'LMLMLMLMM')
rover.navigation

rover = Rover.new(3, 3, 'E', 'MMRMMRMRRM')
rover.navigation

