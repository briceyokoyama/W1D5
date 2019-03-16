require_relative '00_tree_node.rb'
require 'byebug'

class KnightPathFinder
    
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def build_move_tree

    end

    def find_path

    end

    def self.valid_moves(pos)
        moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2,-1], [-2, 1], [-2, -1]]
        debugger
        valid_moves = []

        moves.each do |move|
            resulting_move = pos + move
            if out_of_bounds?(resulting_move)
                next
            else
                valid_moves << move
            end
        end
        valid_moves
    end

    def []=

    end

    def out_of_bounds?(arr)
        return true if arr[0] + arr[2]  > 7 || arr[0] + arr[2]  < 0
        return true if arr[1] + arr[3]  > 7 || arr[1] + arr[3]  < 0
        false
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        possible_positions = possible_moves.map do |move|
            [pos[0] + move[0], pos[1], move[1]]
        end

        possible_positions.select do |position|
            !@considered_positions.include?(position)
        end
    end

end