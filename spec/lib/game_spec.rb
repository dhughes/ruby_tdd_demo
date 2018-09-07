require './spec/spec_helper'

RSpec.describe Game do
  context 'when all frames are gutter balls' do
    it 'scores 0' do
      # Arrange
      game = Game.new

      # Act
      20.times do
        game.roll(0)
      end

      # Assert
      expect(game.score).to eq 0
    end
  end

  context 'when all rolls are 1' do
    it 'scores 20' do
      # Arrange
      game = Game.new

      # Act
      20.times { game.roll(1) }

      # Assert
      expect(game.score).to eq 20
    end
  end

  context 'when game starts' do
    it 'scores 0' do
      # Arrange
      game = Game.new

      # assert
      expect(game.score).to eq 0
    end
  end

  context 'when a spare is rolled' do
    it 'scores with correct bonus' do
      # Arrange
      game = Game.new

      # Act
      game.roll(5)
      game.roll(5)
      game.roll(3)
      17.times { game.roll(0) }

      # Assert
      expect(game.score).to eq 16
    end
  end

  context 'when a strike is rolled' do
    it 'scores with correct bonus' do
      # Arrange
      game = Game.new

      # Act
      game.roll(10)
      game.roll(4)
      game.roll(3)
      16.times { game.roll(0) }

      # Assert
      expect(game.score).to eq 24
    end
  end

  context 'in all frames' do
    it 'scores 300' do
      # Arrange
      game = Game.new

      # Act
      12.times { game.roll(10) }

      # Assert
      expect(game.score).to eq 300
    end
  end
end
