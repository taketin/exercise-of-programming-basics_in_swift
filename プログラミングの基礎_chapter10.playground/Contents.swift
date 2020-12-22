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
    // 問題 10.9
    func equalLength(lst1: [Int], lst2: [Int]) -> Bool {
        var copiedLst1 = lst1
        var copiedLst2 = lst2
        let lst1Value = copiedLst1.popLast()
        let lst2Value = copiedLst2.popLast()

        if lst1Value == nil && lst2Value == nil {
            return true
        } else if lst1Value != nil && lst2Value != nil {
            return equalLength(lst1: copiedLst1, lst2: copiedLst2)
        }

        return false
    }

    // 問題 10.8
    func saitaKetsueki(lst: [Person], resultLst: [String: Int] = ["A": 0, "B": 0, "AB": 0, "O": 0]) -> String {
        let syukeiList = ketsuekiSyukei(lst: lst)
        return ketsuekiSyukeiMax(lst: syukeiList)
    }

    func ketsuekiSyukeiMax(lst: [String: Int], result: String = "", nextKey: String? = "A") -> String {
        guard let nextKey = nextKey else {
            return result
        }

        var maxResult = nextKey
        if result.count > 0 {
            maxResult = lst[result]! > lst[nextKey]! ? result : nextKey
        }

        let newNextKey: String?
        switch nextKey {
        case "A":
            newNextKey = "B"
        case "B":
            newNextKey = "AB"
        case "AB":
            newNextKey = "O"
        default:
            newNextKey = nil
        }

        return ketsuekiSyukeiMax(lst: lst, result: maxResult, nextKey: newNextKey)
    }

    // 問題 10.7
    func ketsuekiSyukei(lst: [Person], resultLst: [String: Int] = ["A": 0, "B": 0, "AB": 0, "O": 0]) -> [String: Int] {
        guard lst.count > 0 else {
            return resultLst
        }

        var copiedResultLst = resultLst
        var copiedLst = ArraySlice(lst)
        let firstPerson = copiedLst.popFirst()!

        copiedResultLst[firstPerson.bloodType] = copiedResultLst[firstPerson.bloodType]! + 1

        return ketsuekiSyukei(lst: Array(copiedLst), resultLst: copiedResultLst)
    }

    // 問題 10.5
    func gakuseiMax(lst: [Gakusei], gakuseiResult: Gakusei? = nil) -> Gakusei? {
        guard lst.count > 0 else {
            return gakuseiResult
        }

        var copiedLst = ArraySlice(lst)
        let fitstGakusei = copiedLst.popFirst()!
        var maxGakusei = fitstGakusei

        if let gakuseiResult = gakuseiResult, gakuseiResult.tensuu >= fitstGakusei.tensuu {
            maxGakusei = gakuseiResult
        }

        return gakuseiMax(lst: Array(copiedLst), gakuseiResult: maxGakusei)
    }

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
    func testEqualLength() {
        let chapter10 = Chapter10()

        XCTAssertTrue(chapter10.equalLength(lst1: [1,2,3], lst2: [4,5,6]))
        XCTAssertTrue(chapter10.equalLength(lst1: [], lst2: []))
        XCTAssertFalse(chapter10.equalLength(lst1: [1,2,3], lst2: [4,5]))
        XCTAssertFalse(chapter10.equalLength(lst1: [], lst2: [4,5]))
        XCTAssertTrue(chapter10.equalLength(lst1: [1,2,3,4,5,6,7,8,9,10,12,100,1000], lst2: [6,6,6,6,6,6,6,6,6,6,6,6,100000]))
    }

    func testSaitaKetsueki() {
        let chapter10 = Chapter10()

        let person1 = Person(name: "あけちみつひで", height: 181, weight: 83, dateOfBirth: "19501123", bloodType: "A")
        let person2 = Person(name: "かとうきよまさ", height: 165, weight: 63, dateOfBirth: "19451010", bloodType: "A")
        let person3 = Person(name: "さいとうどうさん", height: 181, weight: 83, dateOfBirth: "19560923", bloodType: "A")
        let person4 = Person(name: "すずきいちろ", height: 160, weight: 65, dateOfBirth: "19800301", bloodType: "B")
        let person5 = Person(name: "すずきいちろう", height: 175, weight: 70, dateOfBirth: "19781213", bloodType: "AB")
        let person6 = Person(name: "ほうじょうたかうじ", height: 174, weight: 71, dateOfBirth: "19600228", bloodType: "O")
        let person7 = Person(name: "もうりもとなり", height: 179, weight: 74, dateOfBirth: "19621030", bloodType: "O")

        var lst = [
            person1, person2, person3, person4, person5, person6, person7
        ]
        XCTAssertEqual(chapter10.saitaKetsueki(lst: lst), "A")


        lst = [
            person1, person4, person5, person6
        ]
        // 今のところ結果が同じ時は最後の値を返す。
        XCTAssertEqual(chapter10.saitaKetsueki(lst: lst), "O")

        lst = [
            person5
        ]
        XCTAssertEqual(chapter10.saitaKetsueki(lst: lst), "AB")
    }

    func testKetsuekiSyukei() {
        let chapter10 = Chapter10()

        let person1 = Person(name: "あけちみつひで", height: 181, weight: 83, dateOfBirth: "19501123", bloodType: "A")
        let person2 = Person(name: "かとうきよまさ", height: 165, weight: 63, dateOfBirth: "19451010", bloodType: "A")
        let person3 = Person(name: "さいとうどうさん", height: 181, weight: 83, dateOfBirth: "19560923", bloodType: "A")
        let person4 = Person(name: "すずきいちろ", height: 160, weight: 65, dateOfBirth: "19800301", bloodType: "B")
        let person5 = Person(name: "すずきいちろう", height: 175, weight: 70, dateOfBirth: "19781213", bloodType: "AB")
        let person6 = Person(name: "ほうじょうたかうじ", height: 174, weight: 71, dateOfBirth: "19600228", bloodType: "O")
        let person7 = Person(name: "もうりもとなり", height: 179, weight: 74, dateOfBirth: "19621030", bloodType: "O")

        var lst = [
            person1, person2, person3, person4, person5, person6, person7
        ]
        var result = chapter10.ketsuekiSyukei(lst: lst)
        XCTAssertEqual(result["A"], 3)
        XCTAssertEqual(result["B"], 1)
        XCTAssertEqual(result["AB"], 1)
        XCTAssertEqual(result["O"], 2)

        lst = [
            person1, person4, person5, person6
        ]
        result = chapter10.ketsuekiSyukei(lst: lst)
        XCTAssertEqual(result["A"], 1)
        XCTAssertEqual(result["B"], 1)
        XCTAssertEqual(result["AB"], 1)
        XCTAssertEqual(result["O"], 1)

        lst = [
            person1, person4, person6
        ]
        result = chapter10.ketsuekiSyukei(lst: lst)
        XCTAssertEqual(result["A"], 1)
        XCTAssertEqual(result["B"], 1)
        XCTAssertEqual(result["AB"], 0)
        XCTAssertEqual(result["O"], 1)
    }

    func testGakuseiMax() {
        let chapter10 = Chapter10()

        let gakusei1 = Gakusei(name: "テスト一郎", tensuu: 50)
        let gakusei2 = Gakusei(name: "テスト次郎", tensuu: 80)
        let gakusei3 = Gakusei(name: "テスト三郎", tensuu: 0)
        let gakusei4 = Gakusei(name: "テスト四郎", tensuu: 100)

        XCTAssertEqual(chapter10.gakuseiMax(lst: [gakusei1, gakusei2, gakusei3, gakusei4]), gakusei4)
        XCTAssertEqual(chapter10.gakuseiMax(lst: [gakusei3]), gakusei3)
        XCTAssertEqual(chapter10.gakuseiMax(lst: [gakusei4, gakusei3]), gakusei4)
        XCTAssertEqual(chapter10.gakuseiMax(lst: []), nil)
    }

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
