class Game
	attr_reader :short_game, :long_game, :player0, :player1

	def initialize(data = [])
		@short_game = data.slice! 0, 5
		@long_game = data
		@player0 = Player.new('Roger', point_counter(0))
		@player1 = Player.new('Raf', point_counter(1))
	end
	
	def point_counter(player_number)
		(self.short_game + self.long_game).count(player_number)
	end

	def match_score
		if self.long_game.empty?
			"#{player0.string_score} - #{player1.string_score}"
		elsif there_is_a_winner!
			"winner"
		else 
			deuce? ? 'deuce' : 'advantage'
		end
	end

	def deuce?
		player0.score == player1.score
	end

	def there_is_a_winner!
		(player0.score - player1.score).abs > 1
	end
end

class Player
	attr_reader :name, :string_score
	attr_accessor :score

	def initialize(name, score)
		@name = name
		@score = score			
	end

	def score_name_convert
		{0 => "love",
		 1 => "fifteen",
		 2 => "thirty",
		 3 => "fourty"}
	end

	def string_score
		score_name_convert[self.score] 
	end
end