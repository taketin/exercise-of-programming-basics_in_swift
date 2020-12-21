import UIKit
import XCTest

struct Gakusei: Equatable {
    let name: String
    let tensuu: Int
}

struct Person: Equatable {
    let name: String
    let height: Int
    let weight: Int
    let dateOfBirth: String
    let bloodType: String
}

class Chapter10 {
    // 問題 10.4
    func personSort(lst: [Person], resultLst: [Person] = []) -> [Person] {
        guard lst.count > 0 else {
            return resultLst
        }

        var copiedLst = ArraySlice(lst)
        let firstPerson = copiedLst.popFirst()!
        return personSort(lst: Array(copiedLst), resultLst: personInsert(lst: resultLst, addPerson: firstPerson))
    }

    func personInsert(lst: [Person], addPerson: Person, cursor: Int = 0) -> [Person] {
        if lst.count == 0 {
            return [addPerson]
        }

        if lst[cursor].name == addPerson.name {
            return lst
        }

        if lst[cursor].name > addPerson.name {
            var copiedLst = lst
            copiedLst.insert(addPerson, at: cursor)
            return copiedLst
        }

        if lst[cursor].name < addPerson.name {
            var copiedLst = lst
            guard lst.count > cursor + 1 else {
                copiedLst.append(addPerson)
                return copiedLst
            }

            if lst[cursor + 1].name > addPerson.name {
                copiedLst.insert(addPerson, at: cursor + 1)
                return copiedLst
            }
        }

        return personInsert(lst: lst, addPerson: addPerson, cursor: cursor + 1)
    }

    // 問題 10.3
    func gakuseiSort(lst: [Gakusei], resultLst: [Gakusei] = []) -> [Gakusei] {
        guard lst.count > 0 else {
            return resultLst.reversed()
        }

        var copiedLst = ArraySlice(lst)
        let firstGakusei = copiedLst.popFirst()!
        return gakuseiSort(lst: Array(copiedLst), resultLst: gakuseiInsert(lst: resultLst, addGakusei: firstGakusei))
    }

    func gakuseiInsert(lst: [Gakusei], addGakusei: Gakusei, cursor: Int = 0) -> [Gakusei] {
        if lst.count == 0 {
            return [addGakusei]
        }

        if lst[cursor].tensuu == addGakusei.tensuu {
            return lst
        }

        if lst[cursor].tensuu > addGakusei.tensuu {
            var copiedLst = lst
            copiedLst.insert(addGakusei, at: cursor)
            return copiedLst
        }

        if lst[cursor].tensuu < addGakusei.tensuu {
            var copiedLst = lst
            guard lst.count > cursor + 1 else {
                copiedLst.append(addGakusei)
                return copiedLst
            }

            if lst[cursor + 1].tensuu > addGakusei.tensuu {
                copiedLst.insert(addGakusei, at: cursor + 1)
                return copiedLst
            }
        }

        return gakuseiInsert(lst: lst, addGakusei: addGakusei, cursor: cursor + 1)
    }

    // 問題 10.2
    func insSort(lst: [Int], resultLst: [Int] = []) -> [Int] {
        guard lst.count > 0 else {
            return resultLst
        }

        var copiedLst = ArraySlice(lst)
        let firstNum = copiedLst.popFirst()!
        return insSort(lst: Array(copiedLst), resultLst: insert(lst: resultLst, addNumber: firstNum))
    }

    // 問題 10.1
    func insert(lst: [Int], addNumber: Int, cursor: Int = 0) -> [Int] {
        if lst.count == 0 {
            return [addNumber]
        }

        if lst[cursor] == addNumber {
            return lst
        }

        if lst[cursor] > addNumber {
            var copiedLst = lst
            copiedLst.insert(addNumber, at: cursor)
            return copiedLst
        }

        if lst[cursor] < addNumber {
            var copiedLst = lst
            guard lst.count > cursor + 1 else {
                copiedLst.append(addNumber)
                return copiedLst
            }

            if lst[cursor + 1] > addNumber {
                copiedLst.insert(addNumber, at: cursor + 1)
                return copiedLst
            }
        }

        return insert(lst: lst, addNumber: addNumber, cursor: cursor + 1)
    }
}

let chapter10 = Chapter10()
chapter10.insert(lst: [1,3,4,7,8], addNumber: 5)

class Chapter10Test: XCTestCase {
    func testPersonSort() {
        let chapter10 = Chapter10()

        let person1 = Person(name: "あけちみつひで", height: 181, weight: 83, dateOfBirth: "19501123", bloodType: "A")
        let person2 = Person(name: "すずきいちろ", height: 160, weight: 65, dateOfBirth: "19800301", bloodType: "B")
        let person3 = Person(name: "すずきいちろう", height: 175, weight: 70, dateOfBirth: "19781213", bloodType: "AB")
        let person4 = Person(name: "もうりもとなり", height: 179, weight: 74, dateOfBirth: "19621030", bloodType: "O")

        var lst = [
            person3, person1
        ]
        var expectedLst = [
            person1, person3
        ]
        XCTAssertEqual(chapter10.personSort(lst: lst), expectedLst)

        lst = [
            person2, person4, person1, person3
        ]
        expectedLst = [
            person1, person2, person3, person4
        ]
        XCTAssertEqual(chapter10.personSort(lst: lst), expectedLst)

        lst = [
            person3
        ]
        expectedLst = [
            person3
        ]
        XCTAssertEqual(chapter10.personSort(lst: lst), expectedLst)
    }

    func testPersonInsert() {
        let chapter10 = Chapter10()

        let person1 = Person(name: "あけちみつひで", height: 181, weight: 83, dateOfBirth: "19501123", bloodType: "A")
        let person2 = Person(name: "すずきいちろ", height: 160, weight: 65, dateOfBirth: "19800301", bloodType: "B")
        let person3 = Person(name: "すずきいちろう", height: 175, weight: 70, dateOfBirth: "19781213", bloodType: "AB")
        let person4 = Person(name: "もうりもとなり", height: 179, weight: 74, dateOfBirth: "19621030", bloodType: "O")

        var lst = [
            person1, person2
        ]
        var expectedLst = [
            person1, person2, person3
        ]
        XCTAssertEqual(chapter10.personInsert(lst: lst, addPerson: person3), expectedLst)

        lst = [
            person2, person3, person4
        ]
        expectedLst = [
            person1, person2, person3, person4
        ]
        XCTAssertEqual(chapter10.personInsert(lst: lst, addPerson: person1), expectedLst)

        lst = [
        ]
        expectedLst = [
            person3
        ]
        XCTAssertEqual(chapter10.personInsert(lst: lst, addPerson: person3), expectedLst)
    }

    func testGakuseiSort() {
        let chapter10 = Chapter10()

        let gakusei1 = Gakusei(name: "テスト一郎", tensuu: 50)
        let gakusei2 = Gakusei(name: "テスト次郎", tensuu: 80)
        let gakusei3 = Gakusei(name: "テスト三郎", tensuu: 0)
        let gakusei4 = Gakusei(name: "テスト四郎", tensuu: 100)

        var lst = [
            gakusei3, gakusei1
        ]
        var expectedLst = [
            gakusei1, gakusei3
        ]
        XCTAssertEqual(chapter10.gakuseiSort(lst: lst), expectedLst)

        lst = [
            gakusei2, gakusei4, gakusei1, gakusei3
        ]
        expectedLst = [
            gakusei4, gakusei2, gakusei1, gakusei3
        ]
        XCTAssertEqual(chapter10.gakuseiSort(lst: lst), expectedLst)

        lst = [
            gakusei3
        ]
        expectedLst = [
            gakusei3
        ]
        XCTAssertEqual(chapter10.gakuseiSort(lst: lst), expectedLst)
    }

    func testGakuseiInsert() {
        let chapter10 = Chapter10()

        let gakusei1 = Gakusei(name: "テスト一郎", tensuu: 0)
        let gakusei2 = Gakusei(name: "テスト次郎", tensuu: 55)
        let gakusei3 = Gakusei(name: "テスト三郎", tensuu: 82)
        let gakusei4 = Gakusei(name: "テスト四郎", tensuu: 100)

        var lst = [
            gakusei1, gakusei2
        ]
        var expectedLst = [
            gakusei1, gakusei2, gakusei3
        ]
        XCTAssertEqual(chapter10.gakuseiInsert(lst: lst, addGakusei: gakusei3), expectedLst)

        lst = [
            gakusei2, gakusei3, gakusei4
        ]
        expectedLst = [
            gakusei1, gakusei2, gakusei3, gakusei4
        ]
        XCTAssertEqual(chapter10.gakuseiInsert(lst: lst, addGakusei: gakusei1), expectedLst)

        lst = [
        ]
        expectedLst = [
            gakusei3
        ]
        XCTAssertEqual(chapter10.gakuseiInsert(lst: lst, addGakusei: gakusei3), expectedLst)
    }

    func testInsSort() {
        let chapter10 = Chapter10()

        XCTAssertEqual(chapter10.insSort(lst: [8,4,1,9,3,5]), [1,3,4,5,8,9])
        XCTAssertEqual(chapter10.insSort(lst: [0,4]), [0,4])
        XCTAssertEqual(chapter10.insSort(lst: [9]), [9])
        XCTAssertEqual(chapter10.insSort(lst: [0,1,19,10,3,-1]), [-1,0,1,3,10,19])
    }

    func testInsert() {
        let chapter10 = Chapter10()

        XCTAssertEqual(chapter10.insert(lst: [1,3,4,7,8], addNumber: 5), [1,3,4,5,7,8])
        XCTAssertEqual(chapter10.insert(lst: [], addNumber: 0), [0])
        XCTAssertEqual(chapter10.insert(lst: [], addNumber: 1), [1])
        XCTAssertEqual(chapter10.insert(lst: [0], addNumber: 0), [0])
        XCTAssertEqual(chapter10.insert(lst: [5], addNumber: 3), [3,5])
        XCTAssertEqual(chapter10.insert(lst: [0], addNumber: 1), [0,1])
        XCTAssertEqual(chapter10.insert(lst: [0,10,101], addNumber: 25), [0,10,25,101])
        XCTAssertEqual(chapter10.insert(lst: [-1,0,2], addNumber: 1), [-1,0,1,2])
    }
}

Chapter10Test.defaultTestSuite.run()
