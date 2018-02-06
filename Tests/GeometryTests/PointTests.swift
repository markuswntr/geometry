import XCTest
@testable import Geometry

class PointTests: XCTestCase {

    func testZero() {
        let zero = Point<Int>.zero
        XCTAssertEqual(zero.x, 0)
        XCTAssertEqual(zero.y, 0)
    }

    func testEqual() {
        XCTAssertEqual(Point(x: 6, y: 4), Point(x: 6, y: 4))
        XCTAssertNotEqual(Point(x: 6, y: 4), Point(x: 4, y: 6))
    }

    func testComparable() {
        XCTAssertTrue(Point(x: 2, y: 0) < Point(x: 0, y: 3))
        XCTAssertFalse(Point(x: 6, y: 4) < Point(x: 2, y: 7))
    }

    // MARK: Arithmetic

    func testAddition() {
        // In-place
        var p0 = Point(x: 1, y: 3)
        p0 += Point(x: 3, y: 1)
        XCTAssertEqual(p0.x, 4)
        XCTAssertEqual(p0.y, 4)
        // Copy
        let p1 = Point(x: 1, y: 3) + Point(x: 2, y: -2)
        XCTAssertEqual(p1.x, 3)
        XCTAssertEqual(p1.y, 1)
    }

    func testSubstraction() {
        // In-place
        var p0 = Point(x: 1, y: 3)
        p0 -= Point(x: 3, y: 1)
        XCTAssertEqual(p0.x, -2)
        XCTAssertEqual(p0.y, 2)
        // Copy
        let p1 = Point(x: 1, y: 3) - Point(x: 2, y: -2)
        XCTAssertEqual(p1.x, -1)
        XCTAssertEqual(p1.y, 5)
    }

    func testMultiplication() {
        // In-place
        var p0 = Point(x: 1, y: 3)
        p0 *= Point(x: 3, y: 1)
        XCTAssertEqual(p0.x, 3)
        XCTAssertEqual(p0.y, 3)
        // Copy
        let p1 = Point(x: 1, y: 3) * Point(x: 2, y: -2)
        XCTAssertEqual(p1.x, 2)
        XCTAssertEqual(p1.y, -6)
    }

    // MARK: Signable

    func testSigning() {
        // In-place
        var p = Point(x: 3, y: -3)
        p.negate()
        XCTAssertEqual(p.x, -3)
        XCTAssertEqual(p.y, 3)
        // Copy
        XCTAssertTrue(Point(x: 2, y: -3) == +Point(x: 2, y: -3))
        XCTAssertTrue(Point(x: -2, y: 3) == -Point(x: 2, y: -3))
    }

    // MARK: Linux Bridge

    static var allTests = [
        ("testZero", testZero),
        ("testEqual", testEqual),
        ("testComparable", testComparable),
        ("testAddition", testAddition),
        ("testSubstraction", testSubstraction),
        ("testMultiplication", testMultiplication),
        ("testSigning", testSigning)
    ]
}
