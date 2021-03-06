# Shortest Distance from one source or multiple sources
def in_bound?(pos)
  x, y = pos
  return false if x < 0 || x >= @matrix.length
  return y >= 0 && y < @matrix[0].length
end

def bfs(matrix)
  queue = [source]  # or queue = sources
  distance = 0
  visiting = Set.new(queue)

  @matrix = matrix
  # target =

  while !queue.empty?
    children = []
    queue.each do |pos|
      x, y = pos
      # next if @matrix[x][y] != 0
      return distance if pos == target

      [[x+1, y], [x-1, y], [x, y-1], [x, y+1]].each do |next_pos|
        next if !in_bound?(next_pos)
        next if visiting.include?(next_pos)

        visiting.add(next_pos)
        children << next_pos
      end
    end
    queue = children
    distance += 1
  end

  return distance
end