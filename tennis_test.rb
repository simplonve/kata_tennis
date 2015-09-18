require './tennis'
require 'minitest/autorun'

class TennisTest < MiniTest::Test
	def test_love_love
		assert_equal 'love - love', Game.new().match_score 
	end

	def test_fifteen_love
		assert_equal 'fifteen - love', Game.new([0]).match_score 
	end
	
	def test_fifteen_fifteen
		assert_equal 'fifteen - fifteen', Game.new([0, 1]).match_score 
	end

	def test_fifteen_thirty
		assert_equal 'fifteen - thirty', Game.new([0, 1, 1]).match_score 
	end

	def test_first_deuce
		assert_equal 'deuce', Game.new([0,0,0,1,1,1]).match_score
	end

	def test_first_advantage
		assert_equal 'advantage', Game.new([0,0,0,1,1,1,1]).match_score
	end

	def test_seconde_deuce
		assert_equal 'deuce', Game.new([0,0,0,1,1,1,1,0]).match_score
	end

	def test_seconde_advantage
		assert_equal 'advantage', Game.new([0,0,0,1,1,1,1,0,0]).match_score
	end

	def test_winner
		assert_equal 'winner', Game.new([0,0,0,1,1,0]).match_score
	end
end
