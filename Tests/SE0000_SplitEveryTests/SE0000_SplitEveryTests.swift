//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2019 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import XCTest
import SE0000_SplitEvery

final class SENNNN_PackageNameTests: XCTestCase {

    func testSplitEveryWhenMaxLengthDividesCountEvenly() {
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8, 9].split(every: 3), [[ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ]])
        XCTAssertEqual("0123456789ABCDEF".split(every: 2), [ "01", "23", "45", "67", "89", "AB", "CD", "EF" ])
        XCTAssertEqual("⌥⌘⎋".split(every: 1).joined(separator: " "), "⌥ ⌘ ⎋")
    }

    func testSplitEveryWhenMaxLengthDividesCountUnevenly() {
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7].split(every: 3), [[ 1, 2, 3 ], [ 4, 5, 6 ], [ 7 ]])
        XCTAssertEqual((1...7).split(every: 3), [[ 1, 2, 3 ], [ 4, 5, 6 ], [ 7 ]])
        XCTAssertEqual("0123456789ABCDE".split(every: 2), [ "01", "23", "45", "67", "89", "AB", "CD", "E" ])
    }

    func testSplitEveryWhenMaxLengthIsGreaterThanCount() {
        XCTAssertEqual([ 1, 2 ].split(every: 3), [[ 1, 2 ]])
        XCTAssertEqual((1...2).split(every: 3), [[ 1, 2 ]])
        XCTAssertEqual("01".split(every: 3), [ "01" ])
    }

    func testSplitEveryConsumesSequenceOnce() {
        var iterationCount = 0
        let parts = AnySequence(0..<10)
            .lazy
            .filter { (i) -> Bool in
                iterationCount += 1
                return i.isMultiple(of: 2)
            }
            .split(every: 2)
        XCTAssertEqual(iterationCount, 10)
        XCTAssertEqual(parts, [[ 0, 2 ], [ 4, 6 ], [ 8 ]])
    }

}
