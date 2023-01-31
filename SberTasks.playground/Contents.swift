import Foundation


// MARK: - Task 1

/// 1 Дана произвольная строка из букв и цифр. Найти максимальную большую по длине подстроку, в которой количество букв и цифр равно.
/// - Parameter string: string for analysis
/// - Returns: Found substring or nil if there is no such substring
func getBalancedString(_ string: String) -> String? {
    // Convert string to array of strings for the convenience of accessing the indexes.
    // There will be no problems because the string can contain either numbers or letters
    // by condition of  task
    let stringArray = Array(string)
    var letterCount = 0
    var numberCount = 0
    var maximumSymbols = 0
    var substringIndexes = (startIndex: 0, endIndex: 0)
    
    for i in 0..<stringArray.count {
        letterCount = 0
        numberCount = 0
        for j in i..<stringArray.count {
            if stringArray[j].isNumber {
                numberCount += 1
            } else {
                letterCount += 1
            }
            if numberCount == letterCount, numberCount > maximumSymbols {
                maximumSymbols = numberCount
                substringIndexes = (i, j)
            }
        }
    }
    
    if maximumSymbols == 0 {
        return nil
    }
    return String(stringArray[substringIndexes.startIndex...substringIndexes.endIndex])
}

// Testing
assert(getBalancedString("123aaaaaaaaaa123") == "123aaa", "failed with 123aaaaaaaaaa123")
assert(getBalancedString("abc1239999") == "abc123", "failed with abc1239999")
assert(getBalancedString("a1b2c3b4bbbb888888888888") == "a1b2c3b4bbbb8888",
       "failed with a1b2c3b4bbbb888888888888")
assert(getBalancedString("abc12345hello") == "abc12345he", "failed with abc12345hello")
assert(getBalancedString("12abc345hello") == "12abc345he", "failed with 12abc345hello")
assert(getBalancedString("11111") == nil, "failed with 11111")
assert(getBalancedString("aaaaa") == nil, "failed with aaaaa")
assert(getBalancedString("") == nil, "failed with empty string")


// MARK: - Task 2 decision 1
/// Это решение с использованием встроенных функций в swift

let arr1 = [1, 2, 4, 5, 8]
let arr2 = [3, 7, 8, 10]
let arr3 = [1, 9]
let arr4 = [111, 345, 1101, 1111, 1234, 2341]

/// 2 Даны N отсортированных массива. Написать функцию слияния в один отсортированный массив.
/// - Parameter arrays: sorted arrays
/// - Returns: united sorted arrays
func sortingArrays<T: Comparable>(_ arrays: [T]...) -> [T] {
    return arrays.flatMap({ $0 }).sorted()
}

print(sortingArrays(
    arr1,
    arr2,
    arr3,
    arr4
))

