/* 함수 */

//1. 함수의 선언
//2. 반환값이 없는 함수
//3. 매개변수가 없는 함수
//4. 함수의 호출법

import Cocoa

// 1. 함수의 선언
// func 함수이름(매겨변수1이름: 매개변수1타입, 매겨변수2이름: 매개변수2타입 ....) -> 반환타입 {
// 함수구현부
// return 반환값
// }

func sum(a: Int, b: Int) -> Int{
    return a+b
}


// 2. 반환값이 없는 함수 ('-> Void'를 생략해도 된다.)
// func 함수이름(매겨변수1이름: 매개변수1타입, 매겨변수2이름: 매개변수2타입 ....) -> Void {
// 함수구현부
// return
// }

func printMyName(name: String) -> Void{
    print(name)
}

func printYourName(name: String){
    print(name)
}


// 3. 매개변수가 없는 함수
// func 함수이름( ) -> 반환타입{
// 함수구현부
// return 반환값
// }

func maximumIntegerValue( ) -> Int{
    return Int.max
}

func hello( ) -> Void { print("hello") }

func bye() { print("bye") }


// 4. 함수의 호출법
sum(a: 5, b: 3)
printMyName(name: "CS LEE")
printYourName(name: "GGOMMI")
maximumIntegerValue()
hello()
bye()
