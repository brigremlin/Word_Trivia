#adds colorize gem to add color to text
require 'colorize'

class Game 
  attr_accessor :name, :hint1, :hint2, :hint3, :input
  
  def self.database
    words = [
    {name: "cat", hint1: "I have four legs", hint2: "I'm a house pet", hint3: "I'm picky about who I like to be around"},
   {name: "orange", hint1: "I have an uneven texture", hint2: "I'm often used in smoothies", hint3: "I grow on trees"},
   {name: "orange", hint1: "I have an uneven texture", hint2: "I'm often used in smoothies", hint3: "I grow on trees"}
    ]
    random_word = words.shuffle.first
  end

  def game_menu(game)
    puts "Welcome to our trivia game!"
    puts "Are you ready to get started?\n"
    puts "1) To start game"
    puts "2) To quit"
    @input = gets.chomp
    if @input == "1"
      game.play_game(game)
    else
    puts"See you later!"
  end
end

  def play_game(game)
    word = Game.database
    puts word[:hint1]
    puts "What am I? "
    guess = gets.chomp.downcase
      if
        guess == word[:name]
        puts "Hurray! You guessed it!".green
        game.game_menu(game)
      else
          puts word[:hint2]
        guess = gets.chomp.downcase
        if
          guess == word[:name]
          puts "Hurray! You guessed it!".green
        else
        puts word[:hint3]
          guess = gets.chomp.downcase
        if guess == word[:name]
          puts "Hurray! You guessed it!".green
          puts
        else
        puts "Sorry! The correct answer is #{word[:name]}\n".red
        end
        end
    end
  end
end

#Main project run
game = Game.new
game.game_menu(game)
while game.input == "1"
  game.game_menu(game)
end