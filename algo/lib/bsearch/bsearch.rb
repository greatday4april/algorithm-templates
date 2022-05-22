class Array
  ''"
  condition should be a function that evaluates as
  [False, False ... True, True, True], aka >= target
  "''
  def bsearch_low(&block)
    low = 0
    high = length - 1
    while low <= high
      mid = (low + high) / 2
      smaller = block.call(self[mid])
      if smaller
        high = mid - 1
      else
        low = mid + 1
      end
    end
    return nil if low >= length

    low
  end

  ''"
  condition should be a function that evaluates as
  [True, True ... False, False, False], aka <= target
  "''
  def bsearch_high(&block)
    low = 0
    high = length - 1
    while low <= high
      mid = (low + high) / 2
      bigger = block.call(self[mid])
      if bigger
        low = mid + 1
      else
        high = mid - 1
      end
    end
    return nil if high < 0

    high
  end
end

if __FILE__ == $PROGRAM_NAME
  p [].bsearch_low { |ele| ele >= 2 } # nil
  p [].bsearch_high { |ele| ele >= 2 } # nil
  p [1].bsearch_low { |ele| ele >= 2 } # nil
  p [1].bsearch_high { |ele| ele <= 0 } # nil

  p [1].bsearch_low { |ele| ele >= 1 } # 0
  p [1].bsearch_high { |ele| ele <= 1 } # 0

  p [1, 3].bsearch_low { |ele| ele >= 1 } # 0
  p [1, 3].bsearch_high { |ele| ele <= 1 } # 0

  p [1, 2, 3, 4, 5, 6].bsearch_low { |ele| ele >= 4 } # 3
  p [1, 2, 3, 4, 5, 6].bsearch_high { |ele| ele <= 4 } # 3

  p [1, 2, 4, 4, 4, 5].bsearch_low { |ele| ele >= 4 } # 2
  p [1, 2, 4, 4, 4, 5].bsearch_low { |ele| ele > 5 } # nil
  p [1, 2, 4, 4, 4, 5].bsearch_low { |ele| ele >= 3 } # 2

  p [1, 2, 4, 4, 4, 5].bsearch_high { |ele| ele <= 4 } # 4
  p [1, 2, 4, 4, 4, 5].bsearch_high { |ele| ele <= 0 } # nil
  p [1, 2, 4, 4, 4, 5].bsearch_high { |ele| ele < 5 } # 4

end
