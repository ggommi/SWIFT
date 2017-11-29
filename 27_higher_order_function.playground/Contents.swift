/* 고차함수 */
//전달인자로 함수를 전달받거나
//함수실행의 결과를 함수로 반환하는 함수

//1. map
//2. filter
//3. reduce

import Cocoa

//1. map
//컨테이너 내부의 기존 데이터를 변형(transform)하여 새로운 컨테이너 생성
//컨테이너의 대표적인 예는 Collection Type이 있다.(Array, Dictionary, Set)

let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]  = [Int]( )
var strings: [String] = [String]( )

// 1)for 구문 사용
for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers) // [0, 2, 4, 6, 8]
print(strings) //["0", "1", "2", "3", "4"]

// 2)map 메서드 사용
// numbers의 각 요소를 2배하여 새로운 배열 반환
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number*2
})

// numbers의 각 요소를 문자열로 변환하여 새로운 배열 반환
strings = numbers.map({(number: Int) -> String in
    return "\(number)"
})

print(doubledNumbers) // [0, 2, 4, 6, 8]
print(strings) // ["0", "1", "2", "3", "4"]

// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저 사용시
doubledNumbers = numbers.map { $0 * 2 }

print(doubledNumbers) // [0, 2, 4, 6, 8]


//2. filter
//컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출

// 1)for 구문 사용
// 변수 사용에 주목!!!
var filtered: [Int] = [Int]()

for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}

print(filtered) // [0, 2, 4]

// 2)filter 메서드 사용
// numbers의 요소 중 짝수를 걸러내어 새로운 배열로 반환
// 변수형도 가능하지만 for구문 사용과 다르게 상수형으로 바로 접근 가능하다.
let evenNumbers: [Int] = numbers.filter {
    (number: Int) -> Bool in
    return number % 2 == 0
}

print(evenNumbers) // [0, 2, 4]


//3. reduce
//컨테이너 내부의 콘텐츠를 하나로 통합

let someNumbers: [Int] = [2, 8, 15]

// 1)for 구문 사용
// 변수 사용에 주목!!!
var result: Int = 0

//someNumbers의 모든 요소를 더한다
for number in someNumbers {
    result += number
}

print(result) //25

// 2)reduce 메서드 사용
// 초기값이 0이고 someNumbers 내부의 모든 값을 더한다
let sum: Int = someNumbers.reduce(0, {
    (first: Int, second: Int) -> Int in
        return first + second
})
print(sum) //25

// 초기값이 0이고 someNumbers 내부의 모든 값을 뺀다
var subtract: Int = someNumbers.reduce(0, {
    (first: Int, second: Int) -> Int in
        return first - second
})
print(subtract) //-25

// 초기값이 3이고 someNumbers 내부의 모든 값을 더한다
let sumFromThree = someNumbers.reduce(3) { $0 + $1 }
print(sumFromThree)
print(someNumbers.reduce(1, {$0 * $1})) //모든값을 곱한 경우
