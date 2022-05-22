# INTERSECTION

def intersection_of_two_lists(arr_a, arr_b)
  idx_a, idx_b = 0, 0
  intersection = []
  while idx_a < arr_a.length && idx_b < arr_b.length
    if arr_a[idx_a] < arr_b[idx_b]
      idx_a += 1
    elsif arr_a[idx_a] > arr_b[idx_b]
      idx_b += 1
    else
      # 如果要删除重复: if intersection.last != arr_a[idx_a]
      intersection.push(arr_a[idx_a])
      idx_a += 1
      idx_b += 1
    end
  end
  intersection
end

# INTERSECTION - Binary Search

# arr_a length m; arr_b length n
# O(mlgn) assume n is way longer
def intersection_binary_search(arr_a, arr_b)
  start_index = 0
  intersection = []
  (0...arr_a.length).each do |a_idx|
    number = arr_a[a_idx]
    # next if a_idx != 0 && number == arr_a[a_idx-1]
    b_index = arr_b.bsearch(number, start_index)
    if b_index
      start_index = b_index + 1
      intersection.push(number)
    end
  end
  intersection
end

# MERGE
def merge_two_sorted_lists(arr_a, arr_b)
  idx_a, idx_b = 0, 0
  output = []
  while idx_a < arr_a.length && idx_b < arr_b.length
    if arr_a[idx_a] <= arr_b[idx_b]
      output << arr_a[idx_a]
      idx_a += 1
    else
      output << arr_b[idx_b]
      idx_b += 1
    end
  end

  return output.concat(arr_a[idx_a..-1]).concat(arr_b[idx_b..-1])
end

p merge_two_sorted_lists([1,2,4,5], [3,6]) #  [1, 2, 3, 4, 5, 6]
p merge_two_sorted_lists([1,2,4,7,8], [3,6]) # [1, 2, 3, 4, 6, 7, 8]