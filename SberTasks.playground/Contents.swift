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
func sortedArray<T: Comparable>(_ arrays: [T]...) -> [T] {
    return arrays.flatMap({ $0 }).sorted()
}

print(sortedArray(
    arr1,
    arr2,
    arr3,
    arr4
))

// MARK: - Task 2 decision 2
/// Это решение с использованием базовых конструкций программирования.
/// Поскольку это решение в коде не особо читаемо я попытался его немного объяснить в конце файла


/// 2 Даны N отсортированных массива. Написать функцию слияния в один отсортированный массив.
/// - Parameter arrays: sorted arrays
/// - Returns: united sorted arrays
func sortedArraySecondDecision(_ arrays: [Int]...) -> [Int] {
    var resultArray = arrays[0]
    // for array in arrays begining with second array
    for i in 1..<arrays.count {
        // for numbers in another array
        for j in 0..<arrays[i].count {
            
            // if it biggest number
            if arrays[i][j] >= resultArray[resultArray.count - 1] {
                // add number at the end and go to next iteration
                resultArray.append(arrays[i][j])
                continue
            }
            // for numbers in result array
            for k in 0..<resultArray.count {
                if arrays[i][j] <= resultArray[k] {
                    // insert number in right position
                    resultArray.insert(arrays[i][j], at: k)
                    break
                }
            }
            
        }
    }
    return resultArray
}

print(sortedArraySecondDecision(
    arr1,
    arr2,
    arr3,
    arr4
))

/*
 0. Дано: [1, 2, 3, 4] [2, 3, 5, 6, 7] [0, 4, 10, 11]
 1. resultArray = [1, 2, 3, 4]
 2. 2(эта двойка из второго массива) >= 4(последнее число из resultArray) ? resutlArray.append(2) и идем переходим к следующему числу(то есть к тройке), а иначе пункт 2.1
 2.1 Пробегаемся по resultArray и проверяем нашу двойку с каждым числом в массиве до тех пор пока она не будет меньше или равна очередного числа в массиве(secondArray[0] <= resultArray[i]). Как только это условие выполнится, мы вставляем это число в наш resultArray по индексу i и приступаем уже к следующему числу
 3. Краткое описание вышенаписанного
    2 >= 4 ? false
    2 <= 1 ? false
    2 <= 2 ? true
    resultArray = [1, 2, 2, 3, 4]
    3 >= 4 ? false
    ...
*/
