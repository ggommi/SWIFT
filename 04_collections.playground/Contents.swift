/* 컬렉션 타입 */
/* Array, Dictionary, Set */

import Cocoa


//1. Array - 순서가 있는 리스트 컬렉션
//2. Dictionary - 키와 값이 쌍으로 이루어진 컬렉션
//3. Set - 순서가 없고, 멤버가 유일한 컬렉션


//1. Array
var integers: Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)
integers.count//배열의크기 = 2
//integers.append(101.1)과 같은 double타입 대입은 불가

integers.contains(100) //이런 멤버를 가지고 있는가? true
integers.contains(99)   //false

integers.remove(at: 0) //0번 인덱스의 값을 없애달라
integers.removeLast() //마지막 인덱스의 값을 없애달라
integers.removeAll()  //모든인덱스의 값을 없애달라
integers.count      //인덱스값 다 지워서 배열의 크기 0
//integers[0] ->이미 지웠기때문에 호출하면 안된다.

//배열의 또 다른 표현법
//Array<Double>과 [Double]는 동일한 표현이다
//[]는 새로운 빈 Array를 의미한다
var doubles: Array<Double> = [Double]( ) //빈 Double Array 생성
var strings: [String] = [String]( ) //빈 String Array 생성
var characters: [Character] = [ ] //빈 Character Array 생성

//let을 이용하여 Array를 선언하면 불변이 된다 (Int형인게 뻔해서 타입을 명시하지 않음)
let immutableArray = [1, 2, 3]
//아래의 경우는 다 불가능하다. 상수인데도 불구하고 추가하거나 삭제를 하기 때문.
//immutableArray.append(1)
//immutableArray.remove(at:0)


//2. Dictionary
//Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
var someDictionary: Dictionary<String, Any> = Dictionary<String, Any> ()
var anyDictionary: Dictionary<String, Any> = [String: Any]( )
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100
anyDictionary
//key의 value를 변경
anyDictionary["someKey"] = "dictionary"
anyDictionary
//Dictionary의 값을비우는 여러가지 방법
anyDictionary.removeValue(forKey: "anotherKey")
anyDictionary["someKey"] = nil
anyDictionary

//Dictionary의 또다른 표현법
let emptyDictionary: [String : String] = [ : ]
let initializedDictionary: [String : String] = ["name": "CS LEE", "gender": "male"]
//let someValue: String = initializedDictionary["name"] 이것은 불가능하다. 불확실성 때문에..


//3. Set
//Set는 안에 중복된 값을 보장해 주지 않는다.
var integerSet: Set<Int> = Set<Int>( )
//집합에 값을 삽입
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)//99를 아무리 많이 넣어줘도 하나만 들어간다.
integerSet
//집합에 값 유무 확인
integerSet.contains(1)
integerSet.contains(2)
//값의 삭제
integerSet.remove(100)
integerSet.removeFirst()
integerSet.count//3개중 2개를 지워서 1개만 남았다.

//Set의 활용 예 (집합의 연산에 사용할 수 있다.)
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

let union: Set<Int> = setA.union(setB)//합집합
let intersection: Set<Int> = setA.intersection(setB) //교집합
let subtraction: Set<Int> = setA.subtracting(setB) // 차집합
//크기 순서대로 정렬(Array에 값을 저장한다.)
let sortedUni: [Int] = union.sorted()
let sortedInt : [Int] = intersection.sorted()
let sortedSub: [Int] = subtraction.sorted()

print(sortedUni)
print(sortedSub)
print(sortedInt)


