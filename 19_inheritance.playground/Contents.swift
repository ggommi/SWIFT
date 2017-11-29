/* 상속 */

//1. 클래스의 상속과 재정의
//2. 사용

import Cocoa

//스위프트의 상속은 클래스, 프로토콜 등에서 가능하다
//열거형, 구조체는 상속이 불가능하다
//스위프트는 다중상속을 지원하지 않는다

//1. 클래스의 상속과 재정의

// class 이름: 상속받을 클래스 이름 {
//  /* 구현부 */
// }

class Person {
    
    var name: String = ""
    
    func selfIntroduce(){
        print("저는 \(name)입니다")
    }
    
    //final 키워드를 사용하여 재정의(Overriding)를 방지할 수 있다.
    final func sayHello() {
        print("hello")
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
    
    //재정의 가능한 class(타입) 메서드라도
    //final 키워드를 사용하면 재정의 할 수 없다
    //메서드 앞의 'static'과 'final class'는 똑같은 역할을 한다
    
    final class func finalClassMethod(){
        print("type method - final class")
    }
}

class Student: Person {
    //var name: String = ""
    var major: String = ""
    
    override func selfIntroduce() {
        print("저는 \(name)이고, 전공은 \(major)입니다")
        //부모클래스의 메소드를 부르는 방법은 super를 쓰면 된다
        //super.selfIntroduce()
    }
    
    override class func classMethod(){
        print("overriden type method - class")
    }
    
    //static을 사용한 타입 메서드는 재정의 할 수 없다
    //ovrride static func typeMethod(){ }
    
    //final 키워드를 사용한 메서드, 프로퍼티도 재정의 할 수 없다.
    //override func sayHello(){ }
    //override class func finalClassMethod(){ }
}


//2. 사용

let cslee: Person = Person()
let ggommi: Student = Student()

cslee.name = "CS LEE"
ggommi.name = "GGOMMI"
ggommi.major = "Swift"

cslee.selfIntroduce()   //저는 CS LEE입니다.
ggommi.selfIntroduce()  //저는 GGOMMI이고, 전공은 Swift입니다

Person.classMethod()
Person.typeMethod()
Person.finalClassMethod()

Student.classMethod()   //이것만 재정의 되었다.
Student.typeMethod()
Student.finalClassMethod()
