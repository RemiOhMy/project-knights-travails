# frozen-string-literal: true

# Module Moveset will contain all necessary functions to create a chess piece's moveset
module Moveset
  KNIGHT = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]].freeze

  def create_moveset(type)
    case type
    when 'knight'
      KNIGHT
    else
      [[0, 0]]
    end
  end
end
