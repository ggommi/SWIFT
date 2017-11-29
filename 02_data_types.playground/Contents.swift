// Swift의 기본 데이터 타입
// Bool, Int, UInt, Float, Double, Character, String 

import Cocoa

//Bool 에서는 0과1은 못쓰고 true/false만 사용한다.
var someBool: Bool = true
someBool = false

//Int : 64bit 정수형 표현
var someInt: Int = -100

//UInt : Unsigned Integer 양의정수 표현
var someUInt: UInt = 100
//someUInt = someInt 로 대입은 불가하다.

//Float : 32bit 부동소수형 표현
var someFloat: Float = 3.14
someFloat = 3 // float에 int를 대입은 가능하다.

//Double : 64bit 부동소수형 표현
var someDouble: Double = 3.14
someDouble = 3 //Double에도 int 대입이 가능하다.
//someDouble = someFloat 로 대입은 불가하다.

//Character : ""로 표현. 한글자만 입력해야한다.
var someCharacter: Character = "☺️"
print(someCharacter)
someCharacter = "A"
someCharacter = "가"
print(someCharacter)

//String : ""로 표현. 여러글자의 입력.
var someString: String = "안녕하세요 ☺️"
print(someString)
someString = someString + " 이충신 입니다 ✌️"
print(someString)


