from typing import List, Callable, Optional

"""
condition should be a function that evaluates as
[False, False ... True, True, True], aka >= target
"""


def bsearch_low(arr: List[int], condition: Callable[[int], bool]) -> Optional[int]:
    low = 0
    high = len(arr) - 1
    while low <= high:
        mid = (low + high) // 2
        smaller = condition(arr[mid])
        if smaller:
            high = mid - 1
        else:
            low = mid + 1

    if low >= len(arr):
        return None

    return low


"""
condition should be a function that evaluates as
[True, True ... False, False, False], aka <= target
"""


def bsearch_high(arr: List[int], condition: Callable[[int], bool]) -> Optional[int]:
    low = 0
    high = len(arr) - 1
    while low <= high:
        mid = (low + high) // 2  # closer to high
        bigger = condition(arr[mid])
        if bigger:
            low = mid + 1
        else:
            high = mid - 1

    if high < 0:
        return None

    return high


if __name__ == '__main__':
    print(bsearch_low([], lambda ele: ele >= 2))  # None
    print(bsearch_high([], lambda ele: ele >= 2))  # None
    print(bsearch_low([1], lambda ele: ele >= 2))  # None
    print(bsearch_high([1], lambda ele: ele <= 0))  # None
    print('--------')

    print(bsearch_low([1], lambda ele: ele >= 1))  # 0
    print(bsearch_low([1], lambda ele: ele <= 1))  # 0
    print(bsearch_low([1, 3], lambda ele: ele >= 1))  # 0
    print(bsearch_high([1, 3], lambda ele: ele <= 1))  # 0
    print('--------')

    print(bsearch_low([1, 2, 3, 4, 5, 6], lambda ele: ele >= 4))  # 3
    print(bsearch_high([1, 2, 3, 4, 5, 6], lambda ele: ele <= 4))  # 3
    print('--------')

    print(bsearch_low([1, 2, 4, 4, 4, 5], lambda ele: ele >= 4))  # 2
    print(bsearch_low([1, 2, 4, 4, 4, 5], lambda ele: ele > 5))  # None
    print(bsearch_low([1, 2, 4, 4, 4, 5], lambda ele: ele >= 3))  # 2
    print('--------')

    print(bsearch_low([1, 2, 4, 4, 4, 5], lambda ele: ele >= 4))  # 2
    print(bsearch_high([1, 2, 4, 4, 4, 5], lambda ele: ele <= 4))  # 4
    print('--------')

    print(bsearch_low([1, 2, 4, 4, 4, 5], lambda ele: ele <= 0))  # None
    print(bsearch_high([1, 2, 4, 4, 4, 5], lambda ele: ele > 5))  # None
