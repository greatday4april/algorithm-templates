# Kth Smallest -> MaxHeap

def kth_largest(elements, k)
  if k < elements.length / 2
    heap = MaxHeap.new
  else
    heap = MinHeap.new
    k = elements.length - k + 1 # 4个里第2个最小的等同于第3个最大的
  end

  elements.each do |ele|
    heap.push(ele)
    heap.pop if heap.size > k
  end

  return heap.top
end


def quick_select_large(arr, k)
  index = quick_select_index(arr, 0, arr.length - 1, arr.length - k + 1)
  arr[index]
end

def quick_select_index(arr, start_idx, end_idx, k)
  return start_idx if start_idx == end_idx

  # use pivot to rearrange the array, small part on left
  index = partition(arr, start_idx, end_idx)
  left_size = index - start_idx + 1
  if left_size == k
    index
  elsif left_size >= k
    quick_select_index(arr, start_idx, index - 1, k)
  else
    quick_select_index(arr, index + 1, end_idx, k - left_size)
  end
end

def partition(arr, start_idx, end_idx)
  # pick the last element as pivot
  pivot = arr[end_idx]

  left = start_idx
  (start_idx...end_idx).each do |right|
    if arr[right] <= pivot
      # swap with the current left
      arr[left], arr[right] = arr[right], arr[left]
      left += 1
    end
  end

  # swap pivot to the right position
  arr[left], arr[end_idx] = arr[end_idx], arr[left]
  left
end