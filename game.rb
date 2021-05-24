class Game
	def initialize
		@player_1 = Player.new('1')
		@player_2 = Player.new('2')
	end

	def start
		puts "New Game Started. Welcome #{@player_1.name} and #{@player_2.name}"
		turn_game
	end

	def check_status
		puts "P1: #{@player_1.lives}/3 vs P2: #{@player_2.lives}/3"
	end

	def winner player
		puts "#{player.name} wins with the score of #{player.lives}/3"
		puts '------------GAME-OVER-------------'
		puts 'Good Bye!'
		exit
	end

	def check_score
		if @player_1.lost_game
			winner @player_2
		elsif @player_2.lost_game
			winner @player_1
		end
	end

	# turn_game is used 1: ask new question, 2: check status, if lost_game happens, then show winner puts, or continue
	def turn_game
		@player_1.new_question
		check_score
		@player_2.new_question
		check_score
		check_status
		puts '------------NEW-TURN-------------'
		turn_game
	end

end
