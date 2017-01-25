require 'game'

describe Game do
  describe '#new' do
    it "has the value 2 for the number of players" do
      game = Game.new(45)
      expect(game.sticks_to_pickup).to eq 0
      expect(game.num_sticks).to eq 45
      expect(game.player_to_move).to eq 'Player 1'
    end
  end

  describe '#is_over?' do
    context 'when game is over' do
      it "returns true" do
        # Arrange
        game = Game.new(0)
        # Act
        result = game.is_over?
        # Assert
        expect(result).to eq true
      end
    end

    context 'when game is not over' do
      it "returns false" do
        game = Game.new(3)
        expect(game.is_over?).to eq false
      end
    end
  end

  describe '#pickup' do
    it "subtracts sticks picked up from current number of sticks" do
      # Arrange
      game = Game.new(50, sticks_to_pickup: 3)
      # Act
      game.pickup
      # Assert
      expect(game.num_sticks).to eq 47
    end

    # context 'when sticks to pickup is greater than 3' do
    #   it 'raises an InvalidPickupError' do
    #
    #   end
    # end
  end

  describe '#switch_player' do
    context "when player to move is player 1" do
      it "changes player 1 to player 2" do
        game = Game.new(50, player_to_move: 'Player 1')
        game.switch_player
        expect(game.player_to_move).to eq 'Player 2'
      end
    end

    context "when player to move is player 2" do
      it "changes player 2 to player 1" do
        game = Game.new(50, player_to_move: 'Player 2')
        game.switch_player
        expect(game.player_to_move).to eq 'Player 1'
      end
    end
  end
end
