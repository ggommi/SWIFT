/* 클로저 */

//1. 정의 방법
//2. 함수의 전달인자로서의 클로저

import Cocoa

//'코드의 블럭'이라고 표현한다
//일급 시민(first-citizen)
//변수, 상수 등으로 저장, 전달인자로 전달이 가능
//함수: 이름이 있는 클로저

// 1.정의 방법
//  {(매개변수 목록) -> 반환타입 in
//   실행코드
//  }

//함수를 사용하는 경우
func sumFunction (a: Int, b: Int) -> Int {
    return a + b
}
var sumResult: Int = sumFunction(a: 1, b: 2)
print(sumResult) //3

//클로저를 사용하는 경우
var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}
sumResult = sum(1,2)
print(sumResult) //3

//함수는 클로저의 일종이므로
//sum변수에는 당연히 함수도 할당 될 수 있다
sum = sumFunction(a:b:)
sumResult = sum(1,2) //sumFunction의 호출
print(sumResult)//3


//2. 함수의 전달인자로서의 클로저
let add: (Int, Int) -> Int
add = { (a: Int, b: Int) -> Int in
    return a + b
}

let subtract: (Int, Int) -> Int
subtract = { (a: Int, b: Int) -> Int in
    return a - b
}

let divide: (Int, Int) -> Int
divide = { (a: Int, b: Int) -> Int in
    return a / b
}

let multiply: (Int, Int) -> Int
multiply = { (a: Int, b: Int) -> Int in
    return a * b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {  //메서드(클로저)를 매개변수로 받는다.
    return method(a, b)
}

var calculated: Int

calculated = calculate (a: 50, b: 100, method: multiply)
print(calculated) //500

//이와 같이 매개변수에 바로 클로저를 삽입할 수 도 있다.
calculated = calculate (a:50, b:100, method: {(left: Int, right: Int) -> Int in
    return left + right 
})
print(calculated) // 150




