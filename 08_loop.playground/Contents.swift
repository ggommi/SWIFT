/*반복문*/

//1. for-in문
//2. while문
//3. repeat-while문

import Cocoa

var integers = [1, 2, 3] //Array
let people = ["CS LEE": 26, "GGOMMI": 3, "JY KIM": 23] //Dictionary

//1. for-in문 (for-each와 비슷)
// for item in items{
//  code
// }

for integer in integers{
    print(integer)
}

//Dictionary에서의 for-in 사용
//Dictionary의 item은 key와 value로 구성된 튜플 타입이다.
for (name, age) in people {
    print("\(name): \(age)")
}


//2. while문
// while condition {
//  code
// }

while integers.count > 1 {
    integers.removeLast()
}


//3. repeat-while문 (do-while과 비슷)
// repeat {
//  code
// }while condition

repeat {
    integers.removeLast()
}while integers.count > 0


