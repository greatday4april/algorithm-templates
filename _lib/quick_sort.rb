def sort_array(nums)
    quick_sort(nums, 0, nums.length-1)
    nums
end

def quick_sort(arr, start_idx, end_idx)
  return if start_idx >= end_idx
  pivot_index = partition(arr, start_idx, end_idx)

  quick_sort(arr, start_idx, pivot_index - 1)
  quick_sort(arr, pivot_index, end_idx)
end

# left pointer is for 找不符合条件的数字，right pointer 是为了找到符合条件的数字，然后两个人交换。
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

class Array
  def merge_sort
    return clone if length <= 1

    mid = (length - 1) / 2
    left_array = self[0..mid].merge_sort
    right_array = self[(mid + 1)...length].merge_sort

    merged = []
    left_idx = 0
    right_idx = 0
    until merged.length == length
      if left_idx < left_array.length && (right_idx >= right_array.length || left_array[left_idx] <= right_array[right_idx])
        merged << left_array[left_idx]
        left_idx += 1
      else
        merged << right_array[right_idx]
        right_idx += 1
      end
    end
    merged
  end
end