import UIKit
import XCTest

class Chapter15 {
    func quickSort<T: Comparable>(lst: [T]) -> [T] {
        let take = { (separater: T, lst: [T], f: (T, T) -> Bool) -> [T] in
            return lst.filter { f($0, separater) }
        }

        let takeLess = { (separater: T, lst: [T]) -> [T] in
            return take(separater, lst, <)
        }

        let takeGreater = { (separater: T, lst: [T]) -> [T] in
            return take(separater, lst, >)
        }

        return lst.count == 0
            ? []
            : quickSort(lst: takeLess(lst[0], Array(lst.dropFirst())))
                + [lst[0]]
                + quickSort(lst: takeGreater(lst[0], Array(lst.dropFirst())))
    }
}

class Chapter15Test: XCTestCase {
    func testQuickSort() {
        let c = Chapter15()

        XCTAssertEqual(c.quickSort(lst: [4,6,1,10,3,5,11]), [1,3,4,5,6,10,11])
        XCTAssertEqual(c.quickSort(lst: [10,0]), [0,10])
    }
}

Chapter15Test.defaultTestSuite.run()
