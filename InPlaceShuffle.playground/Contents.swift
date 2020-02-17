import UIKit

var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(numbers)
 

func slowShuffle(array: inout [Int]) -> [Int] {
    var count = array.count
    if count < 2 { return array }
    
    var copyArray = array
    var result: [Int] = []
    
    while count > 0 {
        let randomNum = Int.random(in: 0 ..< count)
        result.append(copyArray[randomNum])
        copyArray.remove(at: randomNum)
        count -= 1
    }
    return result
}


func inPlaceShuffle(array: inout [Int]) -> [Int] {
    if array.count < 2 { return array }
    var count = array.count - 1
    
    while count > 0 {
        let randomNum = Int.random(in: 0 ..< count)
        array.swapAt(count, randomNum)
        count -= 1
    }
    return array
}

slowShuffle(array: &numbers)
inPlaceShuffle(array: &numbers)

/// Surprise shuffle... :) - Generics
func inPlaceGenericShuffle<T>(array: inout [T]) -> [T] {
    if array.count < 2 { return array }
    var count = array.count - 1
    
    while count > 0 {
        let randomNum = Int.random(in: 0 ..< count)
        array.swapAt(count, randomNum)
        count -= 1
    }
    return array
}

var nums = [1,2,3]
inPlaceGenericShuffle(array: &nums)
