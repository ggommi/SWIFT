/* 클래스(Reference형), 구조체/열거형(Value형) 비교*/

import Cocoa

struct ValueType{
    var property = 1
}

class ReferenceType{
    var property = 1
}

let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance //인스턴스의 값을 복사
secondStructInstance.property = 2

print("first struct instance property : \(firstStructInstance.property)") //1
print("second struct instance property : \(secondStructInstance.property)") //2

let firstClassReference = ReferenceType()
var secondClassReference = firstClassReference //인스턴스의 참조값(메모리의 주소)를 복사
secondClassReference.property = 2

print("first class reference property: \(firstClassReference.property) ")
print("second class reference property: \(secondClassReference.property) ")
