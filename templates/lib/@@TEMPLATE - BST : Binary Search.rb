# Range Binary Search in BST

def search(node)
  return if node.nil?

  search(node.left) if @low_bound < node.val
  output << node.val
  search(node.right) if node.val < @high_bound
end

# lower bound

def inorder_successor(root, p)
  return if root.nil?

  node = root
  candidate = nil
  while node
    # node is similar to mid in binary search
    go_smaller = node.val > @low_bound

    # greedy search to even smaller
    if go_smaller
      candidate = node # if candidate.nil?  || node.val < candidate.val
      node = node.left
    else
      node = node.right
    end
  end

  return candidate
end


def search_iterative(node, target)
  while node
    return node if node.val == target
    if target < node.val
      node = node.left
    else
      node = node.right
    end
  end
end