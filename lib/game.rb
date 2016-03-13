require_relative './player.rb'
require_relative './computer.rb'
require_relative './player.rb'
require 'byebug'

class Game
  TRIES_COUNT = 12
  CODE_LENGTH = 4

  def initialize
    @code = Array.new(CODE_LENGTH) { nil }
    @codemaker = nil
    @master = nil
  end

  def start
    print_introduce_words

    # Computer AI isn't realized now
    # The only user_choice is 2 - mastermind
    user_choice = 1

    case user_choice
    when 1
      set_roles(Computer.new, Player.new)
    when 2
      set_roles(Player.new, Computer.new)
    else
      puts 'Sorry'
      return
    end

    puts 'Okey, lets start!'
    @master.say_hello_words

    @code = @codemaker.generate_code(CODE_LENGTH)

    start_guessing
  end

  private

  def print_introduce_words
    puts 'Hello! Welcome to MasterMind game'
    puts 'Whom you want to be?'
    puts '1. Codemacker'
    puts '2. Mastermind'
  end

  def set_roles(codemaker, master)
    @codemaker = codemaker
    @master = master
  end

  def start_guessing
    current_try = 0
    while current_try < TRIES_COUNT
      puts "\nYou have #{TRIES_COUNT - current_try} tries"
      current_try += 1
      guess = @master.guess
      feedback = feedback(guess)

      puts "Black pegs: #{feedback[:black]}"
      puts "White pegs: #{feedback[:white]}"

      if feedback[:black] == 4
        puts "Congratulaitons! You guess the code! It was #{@code.join}"
        break
      end

      puts "Looser! The code was #{@code.join}" if current_try == TRIES_COUNT
    end
  end

  def feedback(guess)
    result = { black: 0, white: 0 }

    code = @code.clone

    # Check for number and position matching
    guess.each_index do |i|
      next unless code[i] == guess[i]

      result[:black] += 1
      code[i] = nil
      guess[i] = nil
    end

    # Check for other number matching
    guess.each_index do |i|
      index = code.index(guess[i])
      next if index.nil? || index == -1 || guess[i].nil?

      result[:white] += 1
      guess[i] = nil
      code[index] = nil
    end

    result
  end
end
