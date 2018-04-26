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
        XCTAssertEqual(Point(x: 6.0, y: 4.5), Point(x: 6.0, y: 4.5))
        XCTAssertNotEqual(Point(x: 6, y: 4), Point(x: 4, y: 6))
    }

    func testComparable() {
        XCTAssertTrue(Point(x: 2, y: 0) < Point(x: 0, y: 3))
        XCTAssertFalse(Point(x: 6, y: 4) < Point(x: 2, y: 7))
    }

    // MARK: - Arithmetic

//    func testAddition() {
//        // In-place
//        var p0 = Point(x: 1, y: 3)
//        p0 += Point(x: 3, y: 1)
//        XCTAssertEqual(p0.x, 4)
//        XCTAssertEqual(p0.y, 4)
//        // Copy
//        let p1 = Point(x: 1, y: 3) + Point(x: 2, y: -2)
//        XCTAssertEqual(p1.x, 3)
//        XCTAssertEqual(p1.y, 1)
//    }
//
//    func testSubstraction() {
//        // In-place
//        var p0 = Point(x: 1, y: 3)
//        p0 -= Point(x: 3, y: 1)
//        XCTAssertEqual(p0.x, -2)
//        XCTAssertEqual(p0.y, 2)
//        // Copy
//        let p1 = Point(x: 1, y: 3) - Point(x: 2, y: -2)
//        XCTAssertEqual(p1.x, -1)
//        XCTAssertEqual(p1.y, 5)
//    }
//
//    func testMultiplication() {
//        // In-place
//        var p0 = Point(x: 1, y: 3)
//        p0 *= Point(x: 3, y: 1)
//        XCTAssertEqual(p0.x, 3)
//        XCTAssertEqual(p0.y, 3)
//        // Copy
//        let p1 = Point(x: 1, y: 3) * Point(x: 2, y: -2)
//        XCTAssertEqual(p1.x, 2)
//        XCTAssertEqual(p1.y, -6)
//    }
//
//    // MARK: Extended
//
//    func testDivision() {
//        // In-place
//        var p0 = Point(x: 10.0, y: 21)
//        p0 /= Point(x: 4.0, y: 7)
//        XCTAssertEqual(p0.x, 2.5)
//        XCTAssertEqual(p0.y, 3.0)
//        // Copy
//        let p1 = Point(x: 10, y: 21) / Point(x: 4, y: -7)
//        XCTAssertEqual(p1.x, 2)
//        XCTAssertEqual(p1.y, -3)
//    }
//
//    func testRemainder() {
//        // In-place
//        var p0 = Point(x: 10.0, y: 21)
//        p0 %= Point(x: 3, y: 7)
//        XCTAssertEqual(p0.x, 1)
//        XCTAssertEqual(p0.y, 0)
//        // Copy
//        let p1 = Point(x: 10, y: 21) % Point(x: 4, y: -7)
//        XCTAssertEqual(p1.x, 2)
//        XCTAssertEqual(p1.y, -3)
//    }
//
//    // MARK: Overflow
//
//    func testAdditionOverflow() {
//        let a = Point<Int8>(x: 5, y: 1) &+ Point<Int8>(x: 10, y: 3)
//        XCTAssertEqual(a.x, 15)
//        XCTAssertEqual(a.y, 4)
//        let b = Point<Int8>(x: 20, y: 100) &+ Point<Int8>(x: 64, y: 121)
//        XCTAssertEqual(b.x, 84)
//        XCTAssertEqual(b.y, -35)
//    }
//
//    func testSubtractionOverflow() {
//        let a = Point<UInt8>(x: 21, y: 10) &- Point<UInt8>(x: 10, y: 2)
//        XCTAssertEqual(a.x, 11)
//        XCTAssertEqual(a.y, 8)
//        let b = Point<UInt8>(x: 10, y: 10) &- Point<UInt8>(x: 2, y: 21)
//        XCTAssertEqual(b.x, 8)
//        XCTAssertEqual(b.y, 245)
//    }
//
//    func testMultiplicationOverflow() {
//        let a = Point<Int8>(x: 2, y: 4) &* Point<Int8>(x: -3, y: 5)
//        XCTAssertEqual(a.x, -6)
//        XCTAssertEqual(a.y, 20)
//        let b = Point<Int8>(x: 2, y: 10) &* Point<Int8>(x: 3, y: 50)
//        XCTAssertEqual(b.x, 6)
//        XCTAssertEqual(b.y, -12)
//    }

    // MARK: Signed

    func testSigning() {
        // In-place
        var p = Point(x: 3, y: -3)
        p.negate()
        XCTAssertEqual(p.x, -3)
        XCTAssertEqual(p.y, 3)
        // Copy
        XCTAssertTrue(Point(x: -2, y: 3) == -Point(x: 2, y: -3))
    }

    // MARK: Linux Bridge

    static var allTests = [
        ("testZero", testZero),
        ("testEqual", testEqual),
        ("testComparable", testComparable),
//        ("testAddition", testAddition),
//        ("testSubstraction", testSubstraction),
//        ("testMultiplication", testMultiplication),
//        ("testDivision", testDivision),
//        ("testRemainder", testRemainder),
//        ("testAdditionOverflow", testAdditionOverflow),
//        ("testSubtractionOverflow", testSubtractionOverflow),
//        ("testMultiplicationOverflow", testMultiplicationOverflow),
        ("testSigning", testSigning)
//        ("testIntegerToFloatingCast", testIntegerToFloatingCast)
    ]
}
