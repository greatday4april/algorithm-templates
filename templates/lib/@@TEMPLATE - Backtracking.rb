require 'set'

def find_words(board, words)
  @matrix = board

  @visiting = Set.new
  @path = []
  @paths = []

  (0...@matrix.length).each do |i|
    (0...@matrix[0].length).each do |j|
      traverse_from([i,j])
    end
  end
end

def in_bound?(pos)
  x , y = pos
  return false if x < 0 || x >= @matrix.length
  return y >= 0 && y < @matrix[0].length
end

def traverse_from(pos)
  return if @visiting.include?(pos)
  x, y = pos
  @path << @matrix[x][y]
  @visiting.add(pos)

  if success
    @paths << @path.clone
  end

  next_cells = [[x+1, y], [x - 1,y], [x, y+1], [x, y-1]].select do |next_cell|
    in_bound?(next_cell) 
  end

  next_cells.each do |next_cell|
    traverse_from(next_cell)
  end

  @path.pop
  @visiting.delete(id)
end