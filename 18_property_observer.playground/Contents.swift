/* 프로퍼티 감시자 */

//1. 정의
//2. 사용

import Cocoa

//프로퍼티 감시자를 사용하면 프로퍼티 값이 변경될 때 원하는 동작을 수행할 수 있다.

// 1. 정의
struct Money {
    
    //프로퍼티 감시자 사용
    //저장프로퍼티 뒤에다가 willSet과 didSet이라는 블럭을 삽입
    var currencyRate: Double = 1100 {
        willSet(newRate){ //바뀌기 직전
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
        }
        
        didSet(oldRate){ //바뀌고 나서
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }
    
    var dollar: Double = 0 {
        //willSet의 암시적 매개변수 이름 newValue
        willSet{
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        //didSet의 암시적 매개변수 이름 oldValue
        didSet{
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니단")
        }
    }
    
    // 연산프로퍼티
    var won: Double {
        get{
           return dollar * currencyRate
        }
        set{
            dollar = newValue / currencyRate
        }
        /* 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없다
             willSet {
         
             }
         */
    }
}

//2. 사용

var moneyInMyPocket: Money = Money()

//환율이 1100.0에서 1150.0으로 변경될 예정입니다.
moneyInMyPocket.currencyRate = 1150
//환율이 1100.0에서 1150.0으로 변경되었습니다

//0.0달러에서 10.0달러로 변경될 예정입니다
moneyInMyPocket.dollar = 10
//0.0달러에서 10.0 달러로 변경되었습니다

print(moneyInMyPocket.won) //11500.0

//프로퍼티 감시자의 기능은
//함수, 메서드, 클로저, 타입 등의 외부에 위치한
//지역/전역 변수에도 모두 사용 가능하다.

var a: Int = 100 {
    willSet{
        print("\(a)에서 \(newValue)로 변경될 예정입니다")
    }
    didSet{
        print("\(oldValue)에서 \(a)로 변경되었습니다")
    }
}

//100에서 200으로 변경될 예정입니다
a = 200
//100에서 200로 변경되었습니다.
