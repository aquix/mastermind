require_relative './game.rb'

class Player
  def say_hello_words
    puts 'Computer will make a 4-length code cipher from numbers 1..6'
    puts 'Your task is to guess it!'
    puts 'Your have 12 tries'
    puts 'Every step you make your guess'
    puts 'If you guessed a correct number in its correct position, you will'\
      'receive a black peg.'
    puts 'If you guessed a correct number, but not in the correct position,'\
      'you receive a white peg.'
    puts 'Good luck!'
  end

  def guess
    input_player_code
  end

  def generate_code(length)
    puts "Enter #{length}-number code:"

    input_player_code
  end

  private

  def input_player_code
    code = nil

    loop do
      guess = gets.chomp
      begin
        raise StandartError if guess.length != Game::CODE_LENGTH
        code = guess.split(//).map(&:to_i)
      rescue Exception
        next
      end
      break
    end

    code
  end

end
