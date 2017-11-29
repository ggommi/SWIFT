/* 클래스 */
//값타입인 Struct와 달리 참조타입이다.
//다중상속이 불가하다.

//1. 프로퍼티 및 메서드
//2. 클래스의 사용
//3. 클래스의 예

import Cocoa

// class 이름{
//  구현부
// }

//1. 프로퍼티 및 메서드
class Sample{
    
    var mutableProperty: Int = 100 // 가변 프로퍼티
    var immutableProperty: Int = 100 // 불변 프르퍼티
    
    static var typeProperty: Int = 100 // 타입 프로퍼티
    
    //인스턴스 메서드
    func instanceMethod(){
        print("instancd method")
    }
    
    //타입 메서드
    //재정의 불가 타입 메서드 - static
    static func typeMethod(){
        print("type method - static")
    }
    
    //재정의 가능 타입 메서드 - class
    class func classMethod(){
        print("type method - class")
    }
}


//2. 클래스의 사용
var mutableReference: Sample = Sample()
mutableReference.mutableProperty = 200
//mutableReference.immutableProperty = 200

let immutableReference: Sample = Sample()
immutableReference.mutableProperty = 200 //Struct와 달리 불변 인스턴스에서도 가변프로퍼티 접근이 가능하다.
//immutableReference.immutableProperty = 200

//타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method


//3. 클래스의 예
class Student{
    var name: String = "unknown"
    var classes: String = "Swift"

    class func selfIntroduce(){ //재정의 가능한 타입메서드
        print("학생입니다")
    }
    func selfIntroduce(){
        print("저는 \(classes)반 \(name)입니다")
    }
}

Student.selfIntroduce() // 학생입니다

var cslee: Student = Student()
cslee.name = "CS LEE"
cslee.classes = "스위프트"
cslee.selfIntroduce()

let ggommi: Student = Student()
ggommi.name = "GGOMMI"// Struct와 달리 불변 인스턴스가 가변프로퍼티에 접근이 가능하다.
ggommi.selfIntroduce()
