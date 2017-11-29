/* Optional */

//1. 일반적인 옵셔널(?)
//2. 암시적 추출 옵셔널(!)

import Cocoa

// nil의 가능성을 명시적으로 표현해준다.
// enum + general의 합작품
// Optional<Int> 혹은 Int? 로 표현한다.

// enum Optional<Wrapped>: ExpressibleByNilLiteral {
//    case none
//    case some(Wrapped)
// }

//1. 일반적인 옵셔널(?)의 사용법
var optionalValue1: Optional<Int> = nil
var optionalVlalue1: Int? = nil

//2. 암시적 추출 옵셔널(Implicitly Unwrapped Optional, !)
var optionalValue2: Int! = 100

//optional type 자체는 열거형이기 때문에 case문으로 만들 수 있다.
switch optionalValue2 {
    case .none: //값이 없으면
        print("This Optional variable is nil")
    case .some(let value): //값이 있으면
        print("Value is \(value)")
}

// 옵셔널(?)은 일반적인 값과 다른타입이므로 연산이 불가능하다
// optionalValue1 = optionalValue1 + 1
// 하지만 암시적 추출 옵셔널(!)은 기존 변수처럼 연산이 가능하다
optionalValue2 = optionalValue2 + 1 //단 nil이 아닐때여야한다.,nil이면 Run-time error 발생



