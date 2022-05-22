# BINARY SEARCH

def bsearch_low(nums, target)
  return nil if nums.empty?

  low, high = 0, nums.length - 1
  while low <= high
    mid = (low + high) / 2
    # return mid if nums[mid] == target

    go_left = nums[mid] >= target # if we are looking for low bound

    if go_left
      high = mid - 1
    else
      low = mid + 1
    end
  end

  return low < nums.length ? low : nil
end

def bsearch_high(nums, target)
  return nil if nums.empty?

  low, high = 0, nums.length - 1
  while low <= high
    mid = (low + high) / 2
    go_right = nums[mid] <= target # if we are looking for high bound

    if go_right
      low = mid + 1
    else
      high = mid - 1
    end
  end

  return high >= 0 ? high : nil
end