require_relative "PolyTreeNode"
require 'byebug'

class KnightPathFinder
    
    def initialize(position)
        @position = PolyTreeNode.new(position)
        @root_node = position
        @considered_moves = []
        
    end
    
    def build_move_tree
        possible_moves = find_moves(@root_node)
        until @considered_moves.length == 64
            possible_moves.each do |move|
             
    end

    def find_moves(position)
        moves = []
        row, col = position
        moves << PolyTreeNode.new([row + 1, col + 2])
        moves << PolyTreeNode.new([row + 1, col - 2])
        moves << PolyTreeNode.new([row - 1, col + 2])
        moves << PolyTreeNode.new([row - 1, col - 2])
        moves << PolyTreeNode.new([row + 2, col + 1])
        moves << PolyTreeNode.new([row - 2, col + 1])
        moves << PolyTreeNode.new([row + 2, col - 1])
        moves << PolyTreeNode.new([row - 2, col - 1])

        moves.each do |move|
            if @considered_moves.include?(move.value)
                moves.delete(move)
            else
                @considered_moves << move.value
            end
        end

        moves.select { |move| is_valid?(move.value) }
    end


    def is_valid?(position)
        position[0].between?(0, 7) && position[1].between?(0, 7)
    end

    def find_path
    end

end 

knight = KnightPathFinder.new([4,4])
p knight.find_moves([4 , 4])
