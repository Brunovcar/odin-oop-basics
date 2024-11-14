class Board

  attr_accessor :position, :victory

  @@instances = 0
  @@game_board = Array.new(9, '-')
  @@win = 0

  def initialize

    if @@instances < 2
      @player_number = @@instances + 1
      @position = 0
      @victory = 0
      @@instances += 1
    else
      puts "Number of players exceeded (max of 2)"
    end

  end

  def player_round

    puts "\nPlayer #{@player_number} turn"

    @position = nil

    display_board

    while @position == nil

      @position = gets.to_i

      if @position < 0 || @position > 8
        puts "\nInvalid value. Try again.\n"
        @position = nil
      elsif @@game_board[@position] != "-"
        puts "\nPosition occupied. Try again.\n"
        @position = nil
      end

    end

    if @player_number == 1 && @@game_board[@position] == "-"
      @@game_board[@position] = "X"
    end

    if @player_number == 2 && @@game_board[@position] == "-"
      @@game_board[@position] = "O"
    end

  end

  def comparison

    if @player_number == 1
      identifier = "X"
    end

    if @player_number == 2
      identifier = "O"
    end

    case
    when @@game_board[0] == identifier && @@game_board[1] == identifier && @@game_board[2] == identifier
      @@win = 1
    when @@game_board[3] == identifier && @@game_board[4] == identifier && @@game_board[5] == identifier
      @@win = 1
    when @@game_board[6] == identifier && @@game_board[7] == identifier && @@game_board[8] == identifier
      @@win = 1
    when @@game_board[0] == identifier && @@game_board[3] == identifier && @@game_board[6] == identifier
      @@win = 1
    when @@game_board[1] == identifier && @@game_board[4] == identifier && @@game_board[7] == identifier
      @@win = 1
    when @@game_board[2] == identifier && @@game_board[5] == identifier && @@game_board[8] == identifier
      @@win = 1
    when @@game_board[0] == identifier && @@game_board[4] == identifier && @@game_board[8] == identifier
      @@win = 1
    when @@game_board[2] == identifier && @@game_board[4] == identifier && @@game_board[6] == identifier
      @@win = 1
    end

    if @@win == 1
      @victory = 1
    end

  end
  
  def display_board

    puts "\n #{@@game_board[0]} #{@@game_board[1]} #{@@game_board[2]} \n #{@@game_board[3]} #{@@game_board[4]} #{@@game_board[5]} \n #{@@game_board[6]} #{@@game_board[7]} #{@@game_board[8]} "

  end
end 

player_1 = Board.new
player_2 = Board.new

player_turn = 1
turns = 0

while Board.class_variable_get(:@@win) == 0 && turns < 9

  if player_turn == 1
    player_1.player_round
    player_1.comparison
    player_turn = 2
    turns += 1
    if player_1.victory == 1
      player_1.display_board
      puts "\nPlayer 1 wins"
      player_turn = 3
    end
  end

  if player_turn == 2
    player_2.player_round
    player_2.comparison
    player_turn = 1
    if player_2.victory == 1
      player_1.display_board
      puts "\nPlayer 2 wins"
      player_turn = 3
    end
    turns += 1
  end

  if player_turn != 3 && turns == 8
    player_1.display_board
    puts "Draw"
  end

end



