
func binarySearch(list: [Int], value: Int) -> Int? {
    var right = list.count - 1
    var left = 0
    while left <= right {
        let mid = (left + right) / 2
        if list[mid] == value {
            return mid
        }
        if list[mid] < value {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return nil
}

print(binarySearch(list: [1,2,3,4,5], value: 0))
print(binarySearch(list: [1,2,3,4,5], value: 1))
print(binarySearch(list: [1,2,3,4,5], value: 2))
print(binarySearch(list: [1,2,3,4,5], value: 3))
print(binarySearch(list: [1,2,3,4,5], value: 4))
print(binarySearch(list: [1,2,3,4,5], value: 5))
print(binarySearch(list: [1,2,3,4,5], value: 6))


// - MARK: Recursion Extension

extension RandomAccessCollection where Element: Comparable {
  func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
    let range = range ?? startIndex..<endIndex
    guard range.lowerBound < range.upperBound else {
      return nil
    }

    let size = distance(from: range.lowerBound, to: range.upperBound)
    let middle = index(range.lowerBound, offsetBy: size / 2)

    if self[middle] == value {
      return middle
    } else if self[middle] > value {
      return binarySearch(for: value, in: range.lowerBound..<middle)
    } else {
      return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
    }
  }
}

let list = [1, 2, 5, 10, 18, 25, 28, 28, 100, 115, 119]
print(list.binarySearch(for: 0))
print(list.binarySearch(for: 5))
print(list.binarySearch(for: 25))
print(list.binarySearch(for: 100))
