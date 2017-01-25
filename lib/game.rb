class Game
  attr_reader :num_sticks, :player_to_move, :sticks_to_pickup

  def initialize(num_sticks, **options)
    @num_sticks = num_sticks
    @player_to_move = options.fetch(:player_to_move, 'Player 1')
    @sticks_to_pickup = options.fetch(:sticks_to_pickup, 0)
  end

  def pickup
    @num_sticks -= @sticks_to_pickup
  end

  def switch_player
    if @player_to_move == 'Player 1'
      @player_to_move = "Player 2"
    else
      @player_to_move = 'Player 1'
    end
  end

  def play
    until is_over?
      handle_input
      update
      render
    end
  end

  def is_over?
    @num_sticks < 1
  end

  def handle_input
    puts "Enter number sticks to pickup:"
    @sticks_to_pickup = gets.chomp.to_i
  end

  def update
    pickup
    switch_player
  end

  def render
    puts "There are #{@num_sticks} left on the table.\n"
    if is_over?
      puts "#{@player_to_move} wins!"
    else
      puts "It is #{@player_to_move}'s turn."
    end
  end
end
