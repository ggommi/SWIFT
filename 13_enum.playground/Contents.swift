/* 열거형 */

//1. 열거형의 정의
//2. 열거형의 사용
//3. 원시값
//4. 원시값을 통한 초기화
//5. 메서드

import Cocoa

//1. 열거형의 정의
// enum은 타입이므로 대문자 카멜케이스를 사용하여 이름을 정의한다
// 각 case는 소문자 카멜케이스로 정의한다
// 각 case는 그 자체가 고유의 값이다.

//enum 이름 {
//  case 이름1
//  case 이름2
//  case 이름3, 이름4, 이름5
//  ...
//  }

//2. 열거형의 사용
enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sast, sun
}

var day: Weekday = Weekday.mon
day = .tue

print(day)

switch day{
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
default:                //반드시 필요(토요일,일요일 case가 없기때문에)
    print("즐거운 주말!")
}


//3. 원시값
// C언어의 enum처럼 정수값을 가질 수 도 있다
// rawValue를 사용하면 된다
// case별로 각각 다른 값을 가져야 한다.

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach  //이후에는 자동으로 1씩 증가
    case mango //3
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)") //2

//정수 타입 뿐만 아니라
//Hashable 프로토콜을 따르는 모든 타입이 원시값의 타입으로 지정될 수 있다.
enum School: String{
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)") //중등
print("School.university.rawValue == \(School.university.rawValue)")
//문자열에서는 해당 case의 값을 모르면 case의 이름 그대로 가져온다


//4. 원시값을 통한 초기화
// rawValue를 통해 초기화 할 수 있다
// rawValue가 case에 해당하지 않을 수 있으므로
// rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입이다.

//let apple:Fruit = Fruit(rawValue: 0)
let apple: Fruit? = Fruit(rawValue: 0)

if let fruit: Fruit = Fruit(rawValue: 5){
    print("rawValue 5에 해당하는 케이스는 \(fruit)입니다")
}else {
    print("rawValue 5에 해당하는 케이스가 없습니다")
} //rawValue 5에 해당하는 케이스가 없습니다


//5. 메서드
// Swift의 열거형에는 메서드도 추가할 수 있다.

enum Month{
    
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage(){
        switch self{
            case .mar , .apr , .may:
                print("따스한 봄~")
            case .jun, .jul, .aug:
                print("여름 더워요~")
            case .sep, .oct, .nov:
                print("가을은 독서의 계절!")
            case .dec, .jan, .feb:
                print("추운 겨울입니다 ")
            }
    }
}

Month.mar.printMessage()
