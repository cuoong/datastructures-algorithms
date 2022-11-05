import UIKit

/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

 */

func solution(A: [Int], K: Int) -> [Int] {
    // do your work here...
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    for _ in 1...K {
        result = rotateArray(A: result)
    }
    return result
}

func rotateArray(A: [Int]) -> [Int] {
    var newArray = Array<Int>(repeating: 0, count: A.count)
    for i in 0..<A.count - 1 {
        // Shift next index in array to the left
        newArray[i+1] = A[i]
    }
    newArray[0] = A.last!
    return newArray
}

solution(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
solution(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
solution(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2

solution(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]

rotateArray(A: [1,2,3,4,5])

// using stack

func solution1(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    for _ in 1...K {
        let last = result.last!
        result.insert(last, at: 0)
        result.removeLast()
    }
    return result
}

solution1(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
solution1(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
solution1(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2
