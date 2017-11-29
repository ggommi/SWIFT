/* 옵셔널 추출 */
// 1. 옵셔널 바인딩 방식 (Optional Binding)
// 2. 걍제 추출 방식 (Force Unwrapping)

import Cocoa

//잘못된 예시 (전달 되는 값의 타입이 다르기 때문에 컴파일 오류 발생)
/*
func printName(name: String){ //name은 그냥 String 타입이다.
   print(name)
}
var myName: String? = nil   //myName은 옵셔널타입인 반면
printName(myName)
*/


func printName(_ name: String){ //매개변수에 '_'를 사용하면 함수호출 시 'name:'을 쓰지 않아도 된다.
    print(name)
}

//1. 옵셔널 바인딩 방식 (if-let 적용)
var myName1: String! = nil

if let name: String = myName1 {
    printName(name) //변수 name은 if-let 구문 안에서만 사용 가능
}
else{
    print("myName1 == nil")
}

//복수의 옵셔널 변수를 바인딩하기
var myName2: String? = "CS LEE"
var yourName2: String? = nil

//두개의 변수 모두 값이 존재할때만 if-let 실행
if let name: String = myName2, let friend: String = yourName2 {
    print("\(name) and \(friend)")
    //printName(name+friend)
}//yourName2가 nil이기 때문에 else가 호출된다.
else {
    print("some parameter is nil")
}

// nil이었던 값을 채워준다.
yourName2 = "JY KIM"

//두개의 변수 모두 값이 존재하여 if-let 실행
if let name: String = myName2, let friend: String = yourName2 {
    print("\(name) and \(friend)")
}

//2. 강제 추출 방식 (추천하지 않는 방식)
var myName3: String? = "yagom"
printName(myName3!) //!를 사용하여 옵셔널타입을 String 일반타입으로 벗겨냄

//myName3 = nil
//printName(myName3!)
//강제추출시 값이 nil이므로 런타임 오류 발생

