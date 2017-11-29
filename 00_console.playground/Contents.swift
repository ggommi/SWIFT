/* 이름짓기, 콘솔로그, 문자열 보간법 */

import Cocoa

let age: Int = 10; //상수의 설정
var myphone: String = "010-5703-5763"//변수의 설정

print("안녕하세요! 저는 \(age + 16)살입니다")  //문자열 보간법 '\ ()'를 사용한다.

print("\n####################\n")

class Person{
    var name: String = "CS LEE"
    var age: Int = 26
}
var cslee: Person = Person()

print(cslee)//단순히 Person의 인스턴스라는 점만 보여준다.
print("\n####################\n")
dump(cslee) //dump()는 인스턴스의 자세한 설명까지 출력해준다.
print("\n####################\n")
