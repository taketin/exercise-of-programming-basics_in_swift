import UIKit
import XCTest

class Chapter15 {
    func quickSort<T: Comparable>(lst: [T]) -> [T] {
        let take = { (separater: T, lst: [T], f: (T, T) -> Bool) -> [T] in
            return lst.filter
        }

        let takeLess = { (separater: T, lst: [T]) -> [T] in
            return take(separater, lst, <)
        }

        let takeGreater = { (separater: T, lst: [T]) -> [T] in

        }

        return lst.count == 0
            ? []
            : quickSort(lst: takeLess(separater: lst[0], lst: Array(lst.dropFirst())))
            + [lst[0]]
            + quickSort(lst: takeGreater(separater: lst[0], lst: Array(lst.dropFirst())))
    }

    func takeLess(separater: Int, lst: [Int]) -> [Int] {
        return lst.filter { $0 < separater }.sorted()
    }

    func takeGreater(separater: Int, lst: [Int]) -> [Int] {
        return lst.filter { $0 > separater }.sorted()
    }
}

class Chapter15Test: XCTestCase {
    func testQuickSort() {
        let c = Chapter15()

        XCTAssertEqual(c.quickSort(lst: [4,6,1,10,3,5,11]), [1,3,4,5,6,10,11])
        XCTAssertEqual(c.quickSort(lst: [10,0]), [0,10])
    }

    func testTakeLess() {
        let c = Chapter15()

        XCTAssertEqual(c.takeLess(separater: 5, lst: [4,1,7,6]), [1,4])
    }

    func testTakeGreater() {
        let c = Chapter15()

        XCTAssertEqual(c.takeGreater(separater: 5, lst: [4,1,7,6]), [6,7])
    }
}

Chapter15Test.defaultTestSuite.run()

