/* 구조체 */

//1.구조체의 정의
//2.구조체의 사용
//3.구조체 사용 예시

import Cocoa
//참조타입인 Class와 달리 값타입이다.
//struct 이름{
//구현부
//}

//1.구조체 정의
struct Sample {
    var mutableProperty: Int = 100 //가변 프로퍼티(인스턴스 프로퍼티)
    let immutableProperty: Int = 100//불변 프로퍼티(인스턴스 프로퍼티)
    
    static var typeProperty: Int = 100//타입 프로퍼티
    
    //인스턴스 메서드
    func instancemethod(){
        print("instance method")
    }
    
    //타입 메서드
    static func typeMethod(){
        print("type method")
    }
}

//2.구조체 사용

//가변 인스턴스(인스턴스의 변수들을 수정할 수 있다. 단 var 변수만)
var mutable: Sample = Sample()
//mutable.immutableProperty = 200
mutable.mutableProperty = 100

//불변 인스턴스(인스턴스 변수들 자체를 수정할 수 없다. 인스턴스가 불변이기 때문에)
let immutable: Sample = Sample()
//mutable.immutableProperty = 200
//mutable.mutableProperty = 100

//타입 프로퍼티 및 메서드 (타입 자체가 사용가능 - static)
Sample.typeProperty = 300
Sample.typeMethod() //type method


//3.구조체 사용의 예시
struct Student{
    var name: String = "unknown"
    var classes: String = "Swift"
    
    static func selfIntroduce(){ //타입 메서드
        print("학생타입입니다")
    }
    
    func selfIntroduce(){ //인스턴스 메서드
        print("저는 \(classes)반 \(name) 입니다")
    }
}

Student.selfIntroduce() // 학생타입입니다

var cslee: Student = Student()
cslee.name = "CS LEE"
cslee.classes = "스위프트"
cslee.selfIntroduce() //저는 스위프트반 CS LEE 입니다

let ggommi: Student = Student()
//불변 인스턴스이므로 프로퍼티 값 변경 불가
//컴파일 오류 발생
//ggommi.name = "ggommi"
ggommi.selfIntroduce() //인스턴스 메서드는 불러 올 수 있다.
