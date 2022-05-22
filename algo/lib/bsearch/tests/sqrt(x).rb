require_relative '../bsearch'

''"
Implement int sqrt(int x).

Compute and return the square root of x, where x is guaranteed to be a non-negative integer.

Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.
"''
def my_sqrt(x)
  return 0 if x == 0

  low = 1
  high = x
  while low <= high
    mid = (low + high) / 2
    bigger = mid * mid <= x
    if bigger
      low = mid + 1
    else
      high = mid - 1
    end
  end

  high
end

p my_sqrt(4)
p my_sqrt(8)
p my_sqrt(24)
p my_sqrt(36)
