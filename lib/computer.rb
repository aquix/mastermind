require 'byebug'
require_relative './game.rb'

class Computer
  def generate_code(length)
    code = []
    length.times do
      code << (rand 6) + 1
    end

    code
  end

  def say_hello_words
    puts 'Now you are CodeMaker!'
    puts 'Enter a code. And a computer will try to guess it'
  end

  def guess
    [1, 2, 3, 4]
  end
end
