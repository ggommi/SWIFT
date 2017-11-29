/*
 Any - Swift의 모든 타입을 지칭하는 키워드
 AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
 nil - 없음을 의미하는 키워드
 */
import Cocoa

var someAny: Any = 100
someAny = "어떤 타입도 수용이 가능합니다"
someAny = 123.12 //Double타입의 값을 Any타입에 넣었다

// let someDouble: Double = someAny  //불가능하다

class SomeClasss{ }
var someAnyObject: AnyObject = SomeClasss()
//someAnyObject = 123.12 //클래스의 인스턴스에 Double형을 넣으면 안된다. 클래스의 인스턴스를 넣어야 한다.
//someAny = nil //any타입은 어떤 타입도 들어올수 있으나 nil(빈값)은 들어올 수 없다.
//someAnyObject = nil //anyObject타입도 어떤 클래스 타입도 들어올수 있으나 nil(빈값)은 들어올 수 없다.

