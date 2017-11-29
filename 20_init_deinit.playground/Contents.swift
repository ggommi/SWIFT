/* 인스턴스의 생성과 소멸 */
//이니셜라이저와 디이니셜라이저
//init, deinit

//1. 프로퍼티 기본값
//2. 이니셜라이저
//3. 프로퍼티의 초기값이 꼭 필요 없을 때
//4. 실패가능한 이니셜라이저
//5. 디이니셜라이저

import Cocoa

//1. 프로퍼티 기본값
//스위프트의 모든 인스턴스는 초기화와 동시에
//모든 프로퍼티에 유효한 값이 할당되어 있어야 한다
//프로퍼티에 미리 기본값을 할당해두면
//인스턴스가 생성됨과 동시에 초기값을 지니게 된다.

class PersonA {
    //모든 저장 프로퍼티에 기본값을 할당(정석)
    var name: String = "unknown"
    var age: Int = 0
    var nickname: String = "nick"
}

let cslee: PersonA = PersonA()
cslee.name = "CS LEE"
cslee.age = 26
cslee.nickname = "CS"

//2. 이니셜라이저
//프로퍼티 기본값을 지정하기 어려운 경우에는
//이니셜라이저를 통해
//인스턴스가 가져야 할 초기값을 전달할 수 있다.

class PersonB {
    var name: String
    var age: Int
    var nickname: String
    
    //이니셜라이저
    init(name: String, age: Int, nickname: String){
        self.name = name
        self.age  = age
        self.nickname = nickname
    }
}

let jykim: PersonB = PersonB(name: "JY KIM", age: 23, nickname: "MANGDOONG")
//하지만 별명이 없는경우가 있을 수 도 있다
//let jykim: PersonB = PersonB(name: "JY KIM", age: 23, nickname: "")


//3. 프로퍼티의 초기값이 꼭 필요 없을 때
//옵셔널을 사용!

class PersonC {
    var name: String
    var age: Int
    var nickname: String?
    
    //자신의 이니셜라이저를 호출할 시에는
    //convenience 키워드를 사용해 준다.
    convenience init(name: String, age: Int, nickname: String){
        self.init(name: name, age: age)
        self.nickname = nickname
    }
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

let nathan: PersonC = PersonC(name: "Nathan", age: 26)
let mike: PersonC = PersonC(name: "Mike", age: 25, nickname: "M")

//암시적 추출 옵셔널은(!)
//인스턴스 사용에 꼭 필요하지만
//초기값을 할당하지 않고자 할 때 사용한다.

class Puppy {
    
    var name: String
    var owner: PersonC!
    //이 프로퍼티(PersonC)가 꼭 필요할때 암시적 추출 옵셔널을 쓴다.
    //PersonC와 같이 이니셜라이즈 할때 전달되기 어려운 값들은
    //나중에 세팅하기위해 '!' 를 사용한다.
    
    init(name: String){
        self.name = name
    }
    
    func goOut(){
        print("\(name)가 주인 \(owner.name)과 산책을 합니다")
    }
}

let ggommi: Puppy = Puppy(name: "GGOMMI")
//ggommi.goOut()  //주인이름이 nil 인 상태여서 runtime error가 발생한다.
ggommi.owner = nathan //주인을 할당해 준 다음에
ggommi.goOut() //GGOMMI가 주인 Nathan과 산책을 합니다


//4. 실패가능한 이니셜라이저
//이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우
//인스턴스 생성에 실패할 수 있다
//인스턴스 생성에 실패하면 nil을 반환한다
//그래서 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입이다.

class PersonD {
    
    var name: String
    var age: Int
    var nickname: String?
    
    init?(name: String, age: Int){
        if (0...120).contains(age) == false {
            return nil
        }
        if name.count == 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

//let john: PersonD = PersonD(name: "john", age: 23)      //잘못된경우
let john: PersonD? = PersonD(name: "john", age: 23)     //정상인 경우
let joker: PersonD? = PersonD(name: "joker", age: 123)  //나이가 오류인 경우 nil 반환
let batman: PersonD? = PersonD(name: "", age: 10)     //이름이 오류인 경우 nil 반환

//print(joker) //nil
//print(batman)//nil


//5. 디이니셜라이저
//deinit은 클래스의 인스턴스가
//메모리에서 해제되는 시점에 호출된다
//인스턴스가 해제되는 시점에 해야할 일을 구현 할 수 있다.

class PersonE {
    
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC)  {
        self.name = name
        self.child = child
    }
    
    deinit {        //deinit은 매개변수를 가질 수 없다.
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: mike)
donald?.pet = ggommi
donald = nil //donald 인스턴스가 더이상 필요없으므로 메모리에서 헤제
//donald가 nathan에게 ggommi를 인도한다.


