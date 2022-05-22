# GRAPH - TOPOLOGICAL SORT

def topological_sort(edges)
  @vertex_children_map = Hash.new {|h, k| h[k] = []}
  edges.each do |parent, child|
    @vertex_children_map[parent] << child
  end

  @visiting = Set.new
  @visited = {}

  @ids.each { |id| traverse_from(id) }
  @visited.values.reverse.join
end

def traverse_from(id)
  return if @visited.include?(id)

  # dependeing on the question
  raise 'has cycle' if @visiting.include?(id)

  @visiting.add(id)
  @vertex_children_map[id].each { |child_id| traverse_from(child_id) }
  @visiting.delete(id)
  @visited[id] = id
end