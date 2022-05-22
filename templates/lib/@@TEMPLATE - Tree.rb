class Tree
  def initialize(root)
    @root = root
    # option 1
    bfs()

    # option 2
    @max_value = -2**32 # maybe some instance variable to update
    inorder_dfs(root)

    # option 3
    res = divide_and_conquer(root)

    # option 4
    inorder_dfs_iterative(root)
  end

  def bfs()
    return if @root.nil?
    queue = [@root]
    distance = 0
    
    while !queue.empty?
      queue = []
      queue.each do |node|
        VISIT(node) # TODO: imagine what you would do in a loop

        children.push(node.left) if node.left
        children.push(node.right) if node.right
      end
      queue = children
      distance += 1
    end
  end

  def inorder_dfs(node)
    return if node.nil?

    inorder_dfs(node.left)

    VISIT(node) # TODO: imagine what you would do in a loop

    inorder_dfs(node.right)
  end

  # iterative inorder traversal
  def inorder_dfs_iterative
    # base case, maybe 0 or []
    return [] if @root.nil?

    stack = []
    node = @root
    while !stack.empty? || !node.nil?
      if !node.nil?
        stack.push(node)
        node = node.left
      else
        node = stack.pop

        VISIT(node) # TODO: imagine what you would do in a loop

        node = node.right
      end
    end
  end
end


## DIVIDE and CONQUER

def outcome(node)
  # base case, maybe 0 or []
  return 0 if node.nil?

  left_outcome = outcome(node.left) # height, max, size, min or combinations of them
  right_outcome = outcome(node.right)

  @global =  # update global variable

  return [
    left_outcome,
    right_outcome,
    node.val
  ].max # or sum, or something else
end