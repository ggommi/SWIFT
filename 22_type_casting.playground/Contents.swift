/* 타입캐스팅 */

//스위프트의 타입캐스팅은
//인스턴스의 타입을 확인하는 용도
//또는 클래스의 인스턴스를
//부모 혹은 자식 클래스의 타입으로 사용할 수 있는지
//확인하는 용도로 사용한다
//is, as를 사용한다

//1. 타입 확인
//2. 업 캐스팅
//3. 다운 캐스팅(조건부 다운캐스팅 & 강제 다운캐스팅)

import Cocoa

class Person {
    var name: String = ""
    func breath( ){
        print("숨을 쉽니다")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool( ) {
        print("등교를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT( ){
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}

var cslee: Person = Person()
var ggommi: Student = Student()
var jykim: UniversityStudent = UniversityStudent()

//1. 타입 확인
//is를 사용하여 타입을 확인한다.

var result: Bool

result = cslee is Person //true
result = cslee is Student //false
result = cslee is UniversityStudent //false

result = ggommi is Person //true
result = ggommi is Student //true
result = ggommi is UniversityStudent //false

result = jykim is Person //true
result = jykim is Student //true
result = jykim is UniversityStudent //true

if cslee is UniversityStudent{
    print("cslee는 대학생입니다")
}else if cslee is Student {
    print("cslee는 학생입니다")
}else if cslee is Person {
    print("cslee는 사람입니다")
} //cslee는 사람입니다

switch jykim {
    case is Person:
        print("jykim은 사람입니다")
    case is Student:
        print("jykim은 학생입니다")
    case is UniversityStudent:
        print("jykim은 대학생입니다")
    default:
        print("jykim은 사람도, 학생도, 대학생도 아닙니다")
} //jykim은 사람입니다


//2. 업 캐스팅
//as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록
//컴파일러에게 타입정보를 전환해준다
//Any 혹은 AnyObject로도 타입정보를 변환할 수 있다
//암시적으로 처리하므로 생략해도 무방하다

var mike: Person = UniversityStudent() as Person
var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent //컴파일 오류
var jina: Any = Person() //as Any //생략가능

//3. 다운 캐스팅
//as? 또는 as!를 사용하여
//자식 클래스의 인스턴스로 사용할 수 있도록
//컴파일러에게 인스턴스의 타입정보를 전환해준다

//조건부 다운 캐스팅(as?)

var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent //가능
optionalCasted = jenny as? UniversityStudent //nil
optionalCasted = jina as? UniversityStudent //nil
optionalCasted = jina as? Student //nil

//강제 다운 캐스팅(as!)
//넌 무조건 이 역할 할수 있어! 강제야!

var forcedCasted: Student

forcedCasted = mike as! UniversityStudent //마이크 이미 대학생이다.
//forcedCasted = jenny as! UniversityStudent //런타임 오류
//forcedCasted = jina as! UniversityStudent //런타임 오류
//forcedCasted = jina as! Student //런타임 오류

//활용
func doSomethingWithSwitch(someone: Person) {
    switch someone {
        case is UniversityStudent:
            (someone as! UniversityStudent).goToMT()
        case is Student:
            (someone as! Student).goToSchool()
        case is Person:
        (someone as! Person).breath()
    }
}

//위의 doSomethingWithSwitch보단 이 방법이 효율적이다 (UnWrapping)
func doSomething(someone: Person) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    }else if let student = someone as? Student {
        student.goToSchool()
    }else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person)//멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: mike)//멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: jenny)//등교를 합니다
doSomething(someone: cslee)//숨을 쉽니다






