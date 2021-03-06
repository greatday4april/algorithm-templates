# Array Dynamic Programming

def optimal_subarray()
  return 0 if nums.empty?

  # global
  optimal_value = nums.first

  # local state that needed from the smaller subarray
  optimal_value_to = nums.first

  (1...nums.length).each do |idx|
    num = nums[idx]

    # TODO some form of induction
    optimal_value_to = [
      optimal_value_to + num,
      num
    ].max

    optimal_value = [optimal_value, optimal_value_to].max
  end

  return optimal_value
end


def optimal_subsequence(nums)
  return 0 if nums.empty?

  idx_length_map = {0 => 1} # or length_idx_map, depends on the lookup we want

  (1...nums.length).each do |end_idx|
    number = nums[end_idx]
    max_length = 1
    (0...end_idx).each do |prev_idx|
      if nums[prev_idx] < number    # matches the subsequence requirement
        max_length = [
          idx_length_map[prev_idx] + 1,
          max_length
        ].max
      end
    end

    idx_length_map[end_idx] = max_length
  end

  return idx_length_map.values.max
end