# Optimal Path
# INPUT is MATRIX

def in_bound?(pos)
  x , y = pos
  return false if x < 0 || x >= @matrix.length
  return y >= 0 && y < @matrix[0].length
end

def optimal_path(grid)
  return 0 if grid.empty? || grid[0].empty?
  @matrix = grid
  @target = [@matrix.length - 1, @matrix[0].length - 1]

  # @visiting = Set.new # 注意加入visiting后cache失效

  @cache = {}
  return optimal_path_from([0,0])
end

def optimal_path_from(pos)
  return @matrix[pos[0]][pos[1]] if pos == @target
  return @cache[pos] if @cache.key?(pos)

  x, y = pos

  # @visiting.add(id) # 注意这个加入visiting后cache失效

  next_cells = [[x+1, y], [x, y+1]].select do |next_cell|
    in_bound?(next_cell) # && !@visiting.include?(next_cell)
  end

  @cache[pos] = @matrix[x][y] + next_cells.map do |next_cell| # or next_cells.any?
    optimal_path_from(next_cell)
  end.min

  # @visiting.delete(id)
  return @cache[pos]
end


# INPUT is STRING
# require 'set'
def optimal_path(str)
  return [] if str.empty?
  @str = str

  @cache = {}
  return optimal_path_from(0)
end

def optimal_path_from(id) # start_id
  return [] if id == @str.length # could be 0 or true
  return @cache[id] if @cache.key?(id)


  # @visiting.add(id)
  next_ids = #

  # next_ids.select! do |next_id|
  #   in_bound?(next_id) && !@visiting.include?(next_id)
  # end

  @cache[id] = [id] + next_ids.max_by do |next_id| # or next_id.any?
    optimal_path_from(next_id)
  end

  # @visiting.delete(id)
  return @cache[id]
end
