# frozen-string-literal: true

require_relative 'knight'

# Class Board will represent the 8x8 chessboard that the knight class will move around in
# Function knight_moves should use BFS (breadth-first search) to guarantee that it is getting the shortest path

class Board
  def initialize; end

  def knight_moves(start, goal)
    if !goal[0].between?(0, 7) || !goal[1].between?(0, 7) || !start[0].between?(0, 7) || !start[1].between?(0, 7)
      puts 'Error! Start or Goal is outside of the board. The board is only 8 by 8, from [0, 0] to [7,7]!'
      return
    end

    queue = [Knight.new(start)]
    visited = []

    until queue.empty?
      # remove node
      # in practice, depending on the language - use a real queue class
      current = queue.shift

      # process node
      # push the current node's coords to visited to check if any neighbours have already been visited
      return goal_reach(current) if current.coords == goal
      
      visited.push(current.coords.to_s)

      # add neighbours
      neighbours = current.add_neighbours

      # skip any neighbours that have already been visited by checking in the visited array
      neighbours.each do |neighbour|
        queue.push(neighbour) unless visited.include?(neighbour.coords.to_s)
      end
    end
  end

  # helper function for knight_moves
  def goal_reach(current)
    moves = []
    until current.parent.nil?
      moves.push(current.coords)
      current = current.parent
    end
    moves.push(current.coords)
    puts "You've reached your goal in: #{moves.count - 1} move(s)!"
    puts "Here is your move history: \n"
    moves.reverse.each { |move| puts move.to_s }
    moves
  end
end
