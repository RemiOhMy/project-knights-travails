# frozen-string-literal: true

require_relative 'lib/board'

board = Board.new
board.knight_moves([-1, 2], [3, 3])
board.knight_moves([0, 0], [3, 3])
board.knight_moves([0, 0], [6, 7])
