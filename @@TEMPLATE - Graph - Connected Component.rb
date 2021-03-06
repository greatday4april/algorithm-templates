# helper functions
def init_graph(edges)
  @vertex_children_map = Hash.new {|h,k| h[k] = []}
  edges.each do |edge|
    @vertex_children_map[edge[0]] << edge[1]
    @vertex_children_map[edge[1]] << edge[0]
  end
end

def in_bound?(pos)
  x , y = pos
  return false if x < 0 || x >= @matrix.length
  return y >= 0 && y < @matrix[0].length
end

=begin
CONNECTED COMPONENT (UNDIRECTED GRAPH)
=end
def traverse(matrix)
  @matrix = matrix
  @visited = Set.new
  # (0...n).each do |id|
  (0...@matrix.length).each do |i|
    (0...@matrix[0].length).each do |j|
      next if @visited.include?([i, j])

      @visiting = Set.new
      traverse_from([i, j])

      @visiting # 这里从@visiting得到结论
    end
  end
end

# can be BFS as well
def traverse_from(pos)
  return if @visiting.include?(pos)
  return if @visited.include?(pos)
  # return if other constraint

  @visiting.add(pos)

  x, y = pos
  # next_cells.select / next_ids.select
  next_cells = [[x + 1, y], [x - 1, y], [x, y + 1], [x, y -1]].select do |next_cell|
    in_bound?(next_cell)
  end

  # @matrix[x][y] = color # [optional] mark color
  next_cells.each do |next_cell|
    traverse_from(next_cell)
  end
  # No need to revert @visiting because it's no longer being used for detecting circle
  @visited.add(pos)
end

DIRECTIONS = [[1, 1], [-1, 1], [-1, -1], [1, -1], [1,0], [-1,0], [0,1], [0,-1]].freeze