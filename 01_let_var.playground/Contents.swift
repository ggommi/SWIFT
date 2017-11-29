/* 변수와 상수 */

import Cocoa

/*
상수의 선언
 let 이름: 타입 = 값
변수의 선언
 var 이름: 타입 = 값
*/

//값의 타입이 명확하다면 타입은 생략이 가능
// let 이름 = 값
// var 이름 = 값

let constant: String = "차후에 변경이 불가능한 상수 let"
var variable: String = "차후에 변경이 가능한 변수 var"

//상수 선언 후에 나중에 값 할당하기
//나중에 할당하려고 하는 상수나 변수는 타입을 꼭 명시해주어야 한다.

let sum: Int
let inputA: Int = 100
let inputB: Int = 200

//선언 후 첫 할당
sum = inputA + inputB
