class KnightPathFinder

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [@start_pos]
  end

  def self.valid_moves(pos)
    row, col = pos
    @possible = [[row+1,col+2],[row+1,col-2],
                [row+2,col+1],[row+2,col-1],
                [row-1,col+2],[row-1,col-2],
                [row-2, col+1],[row-2,col-1]]
    @possible.select{ |pos| within_board?(pos) }
    end

  end

  def within_board?(pos)
    pos.all?{|num| num > 0 && num < 8 }
  end


  def new_move_positions(pos)
    @possible - @visited_positions
  end

  def find_path(pos)

  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos,value)
    row, col = pos
    @grid[row][col] = value
  end

  def build_move_tree
    @tree
  end


end
