/* 옵셔널 체이닝 */

//옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로
//또다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용 할 수 있다.

import Cocoa

class Person {

    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String){
        self.name = name
    }
    
}

class Apartment {
    
    var buildingNumber: String
    var roomNumber: String
    var guardman: Person?
    var owner: Person?
    
    init(dong: String, ho: String){
        buildingNumber = dong
        roomNumber = ho
    }
    
}

let cslee: Person? = Person(name: "CS LEE")
let apart: Apartment? = Apartment(dong: "102", ho: "603")
let superman: Person? = Person(name: "superman")

//옵셔널 체이닝이 실행 후 결과값이 nil일 수 있으므로
//결과 타입도 옵셔널이다

//예)경비원의 직업을 알아보자

// 1)옵셔널 체이닝을 사용하지 않는 경우
func guardJobWithoutOC(owner: Person?) {
    if let owner = owner { //사람이 존재하는지 아닌지 확인
        if let home = owner.home { //그 사람의 집이 있는지 없는지 확인
            if let guardman = home.guardman { //그 집의 경비원이 있는지 없는지 확인
                if let guardmanjob = guardman.job { //그 경비원의 직업이 있는지 없는지 확인
                    print("우리집 경비원의 직업은 \(guardmanjob)입니다")
                }else {
                    print("우리집 경비원은 직업이 없어요")
                }
            }
        }
    }
}
guardJobWithoutOC(owner: cslee)

// 2)옵셔널 체이닝을 사용한 경우
func guardJobWithOC(owner: Person?){
    if let guardmanjob = owner?.home?.guardman?.job {
        print ("우리집 경비원의 직업은 \(guardmanjob)입니다!")
    }else{
        print("우리집 경비원은 직업이 없어요")
    }
}

guardJobWithOC(owner: cslee) //우리집 경비원은 직업이 없어요

cslee?.home?.guardman?.job // nil
cslee?.home = apart

cslee?.home // Optional(Apartment)
cslee?.home?.guardman // nil

cslee?.home?.guardman = superman

cslee?.home?.guardman // Optional(Person)

cslee?.home?.guardman?.name // superman
cslee?.home?.guardman?.job //nil


//nil 병합 연산자 (??)
cslee?.home?.guardman?.job = "경비원"
var guardJob: String

guardJob = cslee?.home?.guardman?.job ?? "슈퍼맨" // ??보다 앞의 값이 nil이 나오면 "슈퍼맨"을 할당하겠다.
print(guardJob) //경비원

cslee?.home?.guardman?.job = nil
guardJob = cslee?.home?.guardman?.job ?? "슈퍼맨"
print(guardJob) //슈퍼맨
