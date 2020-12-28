import UIKit
import XCTest

struct Person: Equatable {
    let name: String
    let height: Float
    let weight: Float
    let bloodType: String
}

func time2(val:Int) -> Int {
    return val * 2
}

func add3(val:Int) -> Int {
    return val + 3
}

class Chapter13 {
    // 問題13.4
    func compose<T>(func1: @escaping (T) -> T, func2: @escaping (T) -> T) -> ((T) -> T) {
        return { (T) -> T in
            func1(func2(T))
        }
    }

    // 問題13.2
    func personNamae(lst: [Person]) -> [String] {
        return lst.map { $0.name }
    }

    // 問題13.1
    func countKetsueki(lst: [Person], bloodType: String, result: Int = 0) -> Int {
        guard lst.count > 0 else {
            return result
        }

        var copiedLst = lst
        var copiedResult = result
        let person = copiedLst.popLast()

        if bloodType == person?.bloodType {
            copiedResult += 1
        }

        return countKetsueki(lst: copiedLst, bloodType: bloodType, result: copiedResult)
    }
}

class Chapter13Test: XCTestCase {
    func testCompose() {
        let chapter13 = Chapter13()
        let resultFunc = chapter13.compose(func1: time2, func2: add3)
        XCTAssertEqual(resultFunc(4), 14)
    }

    func testPersonNamae() {
        let chapter13 = Chapter13()

        let person1 = Person(name: "一郎", height: 175, weight: 60, bloodType: "A")
        let person2 = Person(name: "二郎", height: 160, weight: 55, bloodType: "B")
        let person3 = Person(name: "三郎", height: 182, weight: 73, bloodType: "O")
        let person4 = Person(name: "四郎", height: 167, weight: 63, bloodType: "AB")

        let lst = [person1,person2,person3,person4]
        let expectedResult = ["一郎","二郎","三郎","四郎"]
        XCTAssertEqual(chapter13.personNamae(lst: lst), expectedResult)
    }

    func testCountKetsueki() {
        let chapter13 = Chapter13()

        let person1 = Person(name: "一郎", height: 175, weight: 60, bloodType: "A")
        let person2 = Person(name: "二郎", height: 160, weight: 55, bloodType: "B")
        let person3 = Person(name: "三郎", height: 182, weight: 73, bloodType: "O")
        let person4 = Person(name: "四郎", height: 167, weight: 63, bloodType: "AB")

        var lst = [person1,person1,person2,person3,person4]
        XCTAssertEqual(chapter13.countKetsueki(lst: lst, bloodType: "A"), 2)
        lst = [person2,person3,person4]
        XCTAssertEqual(chapter13.countKetsueki(lst: lst, bloodType: "A"), 0)
        lst = []
        XCTAssertEqual(chapter13.countKetsueki(lst: lst, bloodType: "AB"), 0)
        lst = [person3,person3,person3]
        XCTAssertEqual(chapter13.countKetsueki(lst: lst, bloodType: "O"), 3)
    }
}

Chapter13Test.defaultTestSuite.run()
