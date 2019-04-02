require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = (@board.size * 0.5).to_i
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        puts @board.print 
    end 

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        else 
            return false
        end 
    end 

    def win?
        if @board.num_ships == 0
            puts "you win"
            return true
        else 
            return false
        end 
    end 

    def game_over?
        if self.lose? || self.win?
            return true
        else 
            return false
        end 
    end 

    def turn
        move = @player.get_move
        attacked = @board.attack(move)
        @board.print
        if attacked == false
            @remaining_misses -= 1
            puts "Remaining Misses: #{@remaining_misses}" 
        else 
            "Remaining Misses: #{@remaining_misses}"
        end 
    end 
end
