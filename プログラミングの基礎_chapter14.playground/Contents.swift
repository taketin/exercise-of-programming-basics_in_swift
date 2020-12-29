import UIKit
import XCTest

struct Gakusei {
    let namae: String
    let tensuu: Int
    let seiseki: String
}

class Chapter14 {
    // 問題14.4
    func gakuseiSum(lst: [Gakusei]) -> Int {
        let tensuuLst = lst.map { $0.tensuu }
        return foldR(lst: tensuuLst, f: +, accumulator: 0)
    }

    func gakuseiSum2(lst: [Gakusei]) -> Int {
        return lst.map { $0.tensuu }.reduce(0, +)
    }

    // 問題14.3
    func foldR<T>(lst: [T], f:(T, T) -> T, accumulator: T) -> T {
        return lst.count > 0 ? foldR(lst: Array(lst.dropFirst()), f: f, accumulator: f(accumulator, lst[0])) : accumulator
    }

    // 問題14.2
    func countA(lst: [Gakusei]) -> Int {
        return lst.filter { $0.seiseki == "A" }.count
    }
    // 問題14.1
    func even(lst: [Int]) -> [Int] {
        return lst.filter { $0 % 2 == 0 }
    }
}

class Chapter14Test: XCTestCase {
    func testGakuseiSum() {
        let chapter14 = Chapter14()

        var lst = [
            Gakusei(namae: "一郎", tensuu: 59, seiseki: "B"),
            Gakusei(namae: "二郎", tensuu: 80, seiseki: "A"),
            Gakusei(namae: "三郎", tensuu: 70, seiseki: "A"),
            Gakusei(namae: "四郎", tensuu: 37, seiseki: "C"),
            Gakusei(namae: "五郎", tensuu: 60, seiseki: "A"),
        ]
        XCTAssertEqual(chapter14.gakuseiSum(lst: lst), 306)
        XCTAssertEqual(chapter14.gakuseiSum2(lst: lst), 306)

        lst = [
            Gakusei(namae: "一郎", tensuu: 0, seiseki: "D"),
            Gakusei(namae: "二郎", tensuu: 0, seiseki: "D"),
        ]
        XCTAssertEqual(chapter14.gakuseiSum(lst: lst), 0)
        XCTAssertEqual(chapter14.gakuseiSum2(lst: lst), 0)
    }

    func testFoldR() {
        let chapter14 = Chapter14()

        XCTAssertEqual(chapter14.foldR(lst: ["春","夏","秋","冬"], f: +, accumulator: ""), "春夏秋冬")
        XCTAssertEqual(chapter14.foldR(lst: [1,2,3,4], f: +, accumulator: 0), 10)
        XCTAssertEqual(chapter14.foldR(lst: [1,2,3,4], f: -, accumulator: 0), -10)
    }

    func testCountA() {
        let chapter14 = Chapter14()

        var lst = [
            Gakusei(namae: "一郎", tensuu: 59, seiseki: "B"),
            Gakusei(namae: "二郎", tensuu: 80, seiseki: "A"),
            Gakusei(namae: "三郎", tensuu: 70, seiseki: "A"),
            Gakusei(namae: "四郎", tensuu: 37, seiseki: "C"),
            Gakusei(namae: "五郎", tensuu: 60, seiseki: "A"),
        ]
        XCTAssertEqual(chapter14.countA(lst: lst), 3)

        lst = [
            Gakusei(namae: "一郎", tensuu: 59, seiseki: "B"),
            Gakusei(namae: "四郎", tensuu: 37, seiseki: "C"),
        ]
        XCTAssertEqual(chapter14.countA(lst: lst), 0)
    }

    func testEven() {
        let chapter14 = Chapter14()

        XCTAssertEqual(chapter14.even(lst: [2,1,6,4,7]), [2,6,4])
        XCTAssertEqual(chapter14.even(lst: [1,7,11]), [])
    }
}

Chapter14Test.defaultTestSuite.run()
