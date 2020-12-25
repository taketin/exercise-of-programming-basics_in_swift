import UIKit
import XCTest

class Chapter11 {
//    a(1)
//    => 2 * a(0) - 1
//    => 2 * 3 - 1
//    => 5
//
//    a(2)
//    => 2 * a(1) - 1
//    => 2 * (2 * a(0) - 1) - 1
//    => 2 * 5 - 1
//    => 9
//
//    a(3)
//    => 2 * a(2) - 1
//    => 2 * (2 * a(1) -1) - 1
//    => 2 * (2 * (2 * a(0) - 1) - 1) - 1
//    => 2 * (2 * (2 * 3 - 1) - 1) - 1
//    => 2 * (2 * 5 - 1) - 1
//    => 2 * 9 - 1
//    => 17
    func a(val: Int) -> Int {
        print(val)
        guard val > 0 else {
            return 3
        }
        return 2 * a(val: val - 1) - 1
    }

    func sumOfSquare(val: Int) -> Int {
        guard val > 0 else {
            return 0
        }
        return val * val + sumOfSquare(val: val - 1)
    }
}

class Chapter11Test: XCTestCase {
    func testA() {
        let chapter11 = Chapter11()

        XCTAssertEqual(chapter11.a(val: 0), 3)
        XCTAssertEqual(chapter11.a(val: 1), 5)
        XCTAssertEqual(chapter11.a(val: 2), 9)
        XCTAssertEqual(chapter11.a(val: 3), 17)
        XCTAssertEqual(chapter11.a(val: 4), 33)
    }

    func testSumOfSquare() {
        let chapter11 = Chapter11()

        XCTAssertEqual(chapter11.sumOfSquare(val: 4), 30)
        XCTAssertEqual(chapter11.sumOfSquare(val: 0), 0)
        XCTAssertEqual(chapter11.sumOfSquare(val: 1), 1)
        XCTAssertEqual(chapter11.sumOfSquare(val: 2), 5)
        XCTAssertEqual(chapter11.sumOfSquare(val: 10), 385)
    }
}

Chapter11Test.defaultTestSuite.run()
