# frozen-string-literal: true

require_relative 'moveset'

# Class Knight to represent a knight piece on an 8x8 chessboard, will hold coordinates and an array of neighbours
# @neighbours will represent the knight's possible moves from its current coordinates @coords
class Knight
  include Moveset
  attr_accessor :coords, :parent

  def initialize(coords, parent = nil)
    @coords = coords
    @neighbours = []
    @parent = parent
    @moveset = create_moveset('knight')
  end

  def add_neighbours
    @moveset.each do |moves|
      # if the move is valid, create a node with the possible move and push it to the current node's @neighbours
      # with self as parent in order to backtrack through move history
      if (@coords[0] + moves[0]).between?(0, 7) && (@coords[1] + moves[1]).between?(0, 7)
        @neighbours.push(Knight.new([@coords[0] + moves[0], @coords[1] + moves[1]], self))
      end
    end

    @neighbours
  end
end
