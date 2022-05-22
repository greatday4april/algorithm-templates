# SLIDING WINDOW


# 在每段段尾换段
def longest_window(str)
  return '' if str.empty?

  start_idx = 0
  window_counter = Hash.new(0) # could be a hash with idx or count as value
  longest = '' # or could be length

  (0...str.length).each do |end_idx|
    char = str[end_idx]
    window_state = # update window state

    # shrink window until it meets requirement
    while window_counter.length
      start_char = str[start_idx]
      window_counter[start_char] -= 1
      window_counter.delete(start_char) if window_counter[start_char] == 0
      start_idx += 1
    end

    longest = str[start_idx..end_idx] if end_idx - start_idx + 1 > longest.length
  end

  return longest
end



# 下一段段首换段
def longest_window(str)
  return '' if str.empty?

  start_idx = 0
  window_counter = Hash.new(0) # could be a hash with idx or count as value
  longest = '' # or could be length

  (0...str.length).each do |end_idx|
    char = str[end_idx]

    # conclude window
    if window_counter.length
      longest = str[start_idx...end_idx] if end_idx - start_idx > longest.length

      # switch window, move start idx to right place
      start_idx =
    end

    window_state = # update window state
  end

  longest = str[start_idx...end_idx] if end_idx - start_idx > longest.length
  return longest
end