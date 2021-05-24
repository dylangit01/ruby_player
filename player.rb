class Player
	attr_reader :name
	# We will need to change lives
	attr_accessor :lives

	def initialize name
		@name = "Player #{name}"
		@lives = 3
	end

	def wrong_answer
		self.lives -= 1
	end

	def lost_game
		self.lives == 0
	end

	def new_question
		new_question = Question.new
		new_question.ask_question name
		print "> "
		answer = $stdin.gets.chomp
		if new_question.check_answer? answer.to_i
			puts "YES! You are correct"
		else
			puts "Seriously? No"
			wrong_answer
		end
	end
end