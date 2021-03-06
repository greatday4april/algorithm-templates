require_relative 'bsearch'

''"
Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
Your algorithm's runtime complexity must be in the order of O(log n).
If the target is not found in the array, return [-1, -1].
"''

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  lower_bound = nums.bsearch_low { |ele| ele >= target }
  return [-1, -1] if lower_bound.nil? || (nums[lower_bound] != target)

  [lower_bound, nums.bsearch_high { |ele| ele <= target }]
end

nums = [5, 7, 7, 8, 8, 10]
target = 8
p search_range(nums, target) # [3,4]

nums = [5, 7, 7, 8, 8, 10]
target = 6
p search_range(nums, target) # [-1, -1]
