from bsearch import bsearch_low, bsearch_high
from typing import List


def search_range(nums: List[int], target: int) -> List[int]:
    lower_bound = bsearch_low(nums, lambda ele: ele >= target)
    if lower_bound is None or (nums[lower_bound] != target):
        return [-1, -1]

    return [lower_bound, bsearch_high(nums, lambda ele: ele <= target)]


nums = [1]
target = 1
print(search_range(nums, target))  # [0, 0]


nums = [5, 7, 7, 8, 8, 10]
target = 8
print(search_range(nums, target))  # [3, 4]

nums = [5, 7, 7, 8, 8, 10]
target = 6
print(search_range(nums, target))  # [-1, -1]
