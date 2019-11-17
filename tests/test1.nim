# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import sparkline
test "empty sequence returns empty string":
  check sparkline(seq[int] @[]) == ""

test "works with integers":
  let numbers = @[67, 71, 77, 85, 95, 104, 106, 105, 100, 89, 76, 66]
  check sparkline(numbers) == "▁▂▃▄▆███▇▅▃▁"

test "works with floats":
  let numbers = @[1.1, 0.1, 0.1, 1.1]
  check sparkline(numbers) == "█▁▁█"

test "if all values are the same they should be treated as minimal value":
  let numbers = @[1,1,1,1,1]
  check sparkline(numbers) == "▁▁▁▁▁"
