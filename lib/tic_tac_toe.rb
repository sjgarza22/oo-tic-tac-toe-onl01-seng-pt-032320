class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8], # Bottom row
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
 

    def initialize
        @board = Array.new(9, " ")
        puts "Welcome to Tic Tac Toe!"
        display_board
    end

    def display_board
        print " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(input)
        @board[input] != " " ? true : false
    end

    def valid_move?(input)
        if (input >= 0 && input <= 8) && (self.position_taken?(input) == false)
            true
        else
            false
        end
    end

    def turn
        input = gets
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            puts "I'm sorry, that isn't a correct choice.\nPlease enter 1-9: "
            turn
        end
    end

    def turn_count
        @board.count {|s| s != " "}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
        winner = false
        WIN_COMBINATIONS.each do |combo|
            x = 0
            line = Array.new
            while x < combo.length
                line << @board[combo[x]]
                x += 1
            end

            if line.all?{|t| t == "X"} || line.all?{|t| t == "O"}
                return combo
            end

        end
        winner
    end

    def full?
        @board.all?{|t| (t == "X") || (t == "O")}
    end

    def draw?
        if full? && (won? == false)
            true
        else
            false
        end
    end

    def over?
        if draw? || won?
            true
        else
            false
        end
    end

    def winner
        if won? != false
            combo = won?
            winner = @board[combo[0]]
        else
            winner = nil
        end
        winner
    end

    def play
        "Please enter 1-9: "
        until over?
            turn
        end

        if winner != nil
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
end