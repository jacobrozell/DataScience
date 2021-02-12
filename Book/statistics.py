from typing import List, Tuple, Callable
from collections import Counter

def _median_odd(xs: List[float]) -> float:
    """If len(xs) is odd, the median is the middle element"""
    return sorted(xs)[len(xs) // 2]

def _median_even(xs: List[float]) -> float:
    """If len(xs) is even, it's the average of the middle two elements"""
    sorted_xs = sorted(xs)
    hi_midpoint = len(xs) // 2  # e.g. length 4 => hi_midpoint 2
    return (sorted_xs[hi_midpoint - 1] + sorted_xs[hi_midpoint]) / 2

def median(v: List[float]) -> float:
    """Finds the 'middle-most' value of v"""
    return _median_even(v) if len(v) % 2 == 0 else _median_odd(v)

def quantile(xs: List[float], p: float) -> float:
    """Returns the pth-percentile value in x"""
    p_index = int(p * len(xs))
    return sorted(xs)[p_index]

def mode(x: List[float]) -> List[float]:
    """Returns a list, since there might be more than one mode"""
    counts = Counter(x)
    max_count = max(counts.values())
    return [x_i for (x_i, count) in counts.items() if count == max_count]

def data_range(xs: List[float]) -> float:
    """Returns the range as a float"""
    return max(xs) - min(xs)

# Tests
assert median([1, 10, 2, 9, 5]) == 5
assert median([1, 9, 2, 10]) == (2 + 9) / 2
assert quantile([100, 49, 41, 40 , 25, 17, 32, 86, 23, 53, 72, 48, 29, 68, 96], 0.10) == 23
assert quantile([100, 49, 41, 40 , 25, 17, 32, 86, 23, 53, 72, 48, 29, 68, 96], 0.25) == 29
assert quantile([100, 49, 41, 40 , 25, 17, 32, 86, 23, 53, 72, 48, 29, 68, 96], 0.75) == 72
assert quantile([100, 49, 41, 40 , 25, 17, 32, 86, 23, 53, 72, 48, 29, 68, 96], 0.90) == 96
assert set(mode([1, 1, 6, 6, 45, 79, 100, 34, 47, 29, 67, 61, 93, 20, 78])) == {1, 6}
assert data_range([1, 1, 6, 6, 45, 79, 100, 34, 47, 29, 67, 61, 93, 20, 78]) == 99
