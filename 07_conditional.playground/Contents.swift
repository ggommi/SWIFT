/*조건문*/

//1. if문
//2. switch문

import Cocoa

let someInteger = 100

//1. if문
// if condition{
//     statements
// else if condition{
//     statements
// else{
//     statements
//}

//소괄호는 생략가능하지만 중괄호는 항상 써줘야 한다.
if someInteger < 100 {
    print("100미만")
}else if someInteger > 100 {
    print("100초과")
}else {
    print("100") //100출력
}

//스위프트의 조건에는 항상 Bool 타입이 들어와야한다.(0,1과 같은 정수가 아닌)
//someInteger는 Bool타입이 아닌 Int 이기에
//if someInteger { } 과 같은경우는 컴파일 오류가 난다.


//2. switch문
// switch value {
//  case pattern:
//    code
//  default:
//    code
// }

//범위 연산자(.., ...)를 활용하면 더욱 쉽고 유용하다
switch someInteger{
    case 0:
        print("zero")
    case 1..<100: //1이상 100미만
        print("1~99")
    case 100:
        print("100")
    case 101...Int.max: // 101이상 Int.max 이하
        print("over 100")
    default:
        print("unknown")
} //100

//정수 외의 대부분의 기본 타입을 사용할 수 있다. 그리고 break를 안써도 된다.
var name: String = "CS LEE"
switch name{
    case "CS LEE":
        print("My name is CS LEE")
        fallthrough // 바로 아래있는 "GGOMMI"경우까지 출력해버린다.
    case "GGOMMI":
        print("My name is GGOMMI")
    case "yagom":
        print("My name is yagom")
    default:
        print("My name is unknown")
}
