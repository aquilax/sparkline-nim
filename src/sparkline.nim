## Library for converting sequence of numbers to console friendly sparkline
##
## Example
## ========
##
## .. code-block:: nim
##
##   doAssert sparkline(@[1, 0, 0, 1]) == "█▁▁█"
##

import unicode

const steps = toRunes("▁▂▃▄▅▆▇█")

proc normalize[T: SomeNumber](nums: seq[T]): seq[int] =
  var capped: seq[T]
  let min = min(nums)
  for i, _ in nums:
    capped.add(nums[i] - min)
  var max = float(max(capped))
  if max == 0:
    max = 1

  for i, _ in capped:
    var x, _ = float(capped[i])
    x = x/max
    x = x * 8
    if x == 8:
      x =7
    result.add(int(x))
  return result


proc sparkline*[T: SomeNumber](nums: seq[T]): string =
  ## Generates sparkline string for the provided sequence of numbers
  if nums.len == 0:
    return ""
  let indexes = normalize(nums)
  result = newStringOfCap(nums.len)

  for i, _ in indexes:
    result.add(steps[indexes[i]])
