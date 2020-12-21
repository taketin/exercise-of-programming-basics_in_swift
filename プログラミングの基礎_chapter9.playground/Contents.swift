import UIKit
import XCTest

struct Person: Equatable {
    let name: String
    let height: Int
    let weight: Int
    let dateOfBirth: String
    let bloodType: String
}

class Chapter9 {
    // p89, 問題9.8
    func uoza(people: [Person], uozaList: [Person] = []) -> [Person] {
        let uozaRange = 0219...0320
        var copiedPeople = people
        var copiedUozaList = uozaList

        guard let person = copiedPeople.popLast() else {
            return uozaList
        }

        if uozaRange.contains(Int(person.dateOfBirth.suffix(4))!) {
            copiedUozaList.append(person)
        }
        return uoza(people: copiedPeople, uozaList: copiedUozaList)
    }

    // p89. 問題9.7
    func countKetsuekiA(people: [Person], count: Int = 0) -> Int {
        var copiedPeople = people
        var copiedCount = count

        guard let person = copiedPeople.popLast() else {
            return count
        }

        if person.bloodType == "A" {
            copiedCount += 1
        }

        return countKetsuekiA(people: copiedPeople, count: copiedCount)
    }

    // p85. 問題9.6
    func concat(items: [String], concatString: String = "") -> String {
        var copiedItems = items
        var copiedConcatString = concatString

        guard let string = copiedItems.popLast() else {
            return String(concatString.reversed())
        }

        copiedConcatString += string
        return concat(items: copiedItems, concatString: copiedConcatString)
    }

    // p85. 問題9.5
    func even(items: [Int], evenItems: [Int] = []) -> [Int] {
        var copiedItems = items
        var copiedEvenItems = evenItems
        guard let item = copiedItems.popLast() else {
            return evenItems
        }

        if item % 2 == 0 {
            copiedEvenItems.append(item)
        }

        return even(items: copiedItems, evenItems: copiedEvenItems)
    }

    // p84. 問題9.4
    func length(items: [Int], count: Int = 0) -> Int {
        var copiedItems = items
        guard let _ = copiedItems.popLast() else {
            return count
        }

        return length(items: copiedItems, count: count + 1)
    }
}

class Chapter9Test: XCTestCase {
    func testUoza() {
        let chapter9 = Chapter9()

        let person1 = Person(name: "一番太郎", height: 150, weight: 50, dateOfBirth: "19890131", bloodType: "A")
        let person2 = Person(name: "二番良子", height: 167, weight: 60, dateOfBirth: "19920321", bloodType: "B")
        let person3 = Person(name: "三番鬼太郎", height: 173, weight: 72, dateOfBirth: "19650218", bloodType: "O")
        let person4 = Person(name: "四番秀美", height: 165, weight: 55, dateOfBirth: "19800219", bloodType: "AB")
        let person5 = Person(name: "五番英雄", height: 175, weight: 62, dateOfBirth: "19780316", bloodType: "AB")

        var array = [person2]
        XCTAssertEqual(chapter9.uoza(people: array), [])

        array = [person1, person2]
        XCTAssertEqual(chapter9.uoza(people: array), [])

        array = [person1, person2, person3]
        XCTAssertEqual(chapter9.uoza(people: array), [])

        array = [person1, person2, person3, person4]
        XCTAssertEqual(chapter9.uoza(people: array), [person4])

        array = [person1, person2, person3, person4, person5]
        XCTAssertEqual(chapter9.uoza(people: array), [person5, person4])
    }

    func testCountKetsuekiA() {
        let chapter9 = Chapter9()

        let person1 = Person(name: "一番太郎", height: 150, weight: 50, dateOfBirth: "19890131", bloodType: "A")
        let person2 = Person(name: "二番良子", height: 167, weight: 60, dateOfBirth: "19921120", bloodType: "B")
        let person3 = Person(name: "三番鬼太郎", height: 173, weight: 72, dateOfBirth: "19650512", bloodType: "O")
        let person4 = Person(name: "四番秀美", height: 175, weight: 62, dateOfBirth: "19780316", bloodType: "AB")

        var array = [person2]
        XCTAssertEqual(chapter9.countKetsuekiA(people: array), 0)

        array = [person1, person2]
        XCTAssertEqual(chapter9.countKetsuekiA(people: array), 1)

        array = [person1, person2, person3]
        XCTAssertEqual(chapter9.countKetsuekiA(people: array), 1)

        array = [person1, person2, person3, person4]
        XCTAssertEqual(chapter9.countKetsuekiA(people: array), 1)

        array = [person1, person2, person3, person4, person1]
        XCTAssertEqual(chapter9.countKetsuekiA(people: array), 2)
    }

    func testConcat() {
        let chapter9 = Chapter9()

        var array = ["春", "夏", "秋", "冬"]
        XCTAssertEqual(chapter9.concat(items: array), "春夏秋冬")

        array = []
        XCTAssertEqual(chapter9.concat(items: array), "")
    }

    func testEven() {
        let chapter9 = Chapter9()

        var array = [1,2,3,4,5]
        XCTAssertEqual(chapter9.even(items: array), [4,2])

        array = []
        XCTAssertEqual(chapter9.even(items: array), [])

        array = [1]
        XCTAssertEqual(chapter9.even(items: array), [])

        array = [1,3,5]
        XCTAssertEqual(chapter9.even(items: array), [])

        array = [1,2,3,4,5,6,7,8,9,10,11,12]
        XCTAssertEqual(chapter9.even(items: array), [12,10,8,6,4,2])
    }

    func testLength() {
        let chapter9 = Chapter9()

        var array = [1,2,3]
        XCTAssertEqual(chapter9.length(items: array), 3)

        array = []
        XCTAssertEqual(chapter9.length(items: array), 0)

        array = [1]
        XCTAssertEqual(chapter9.length(items: array), 1)
    }
}

Chapter9Test.defaultTestSuite.run()
