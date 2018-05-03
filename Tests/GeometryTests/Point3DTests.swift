import XCTest
@testable import Geometry

class Point3DTests: XCTestCase {

    func testZero() {
        let zero = Point3D<Int>.zero
        XCTAssertEqual(zero.x, 0)
        XCTAssertEqual(zero.y, 0)
    }

    func testEqual() {
        XCTAssertEqual(Point3D(a: 6, b: 4), Point3D(a: 6, b: 4, c: 0))
        XCTAssertEqual(Point3D(a: 6.0, b: 4.5), Point3D(a: 6.0, b: 4.5, c: 0))
        XCTAssertNotEqual(Point3D(a: 6, b: 4, c: 0), Point3D(a: 4, b: 6))

        XCTAssertEqual(Point3D(x: 6, y: 4, z: 3), Point3D(x: 6, y: 4, z: 3))
        XCTAssertEqual(Point3D(x: 6.0, y: 4.5, z: 3.2), Point3D(x: 6.0, y: 4.5, z: 3.2))
        XCTAssertNotEqual(Point3D(x: 6, y: 4, z: 18), Point3D(x: 4, y: 6, z: 18))
    }

    func testComparable() {
        XCTAssertTrue(Point3D(x: 2, y: 0, z: 1) < Point3D(x: 0, y: 3, z: 1))
        XCTAssertFalse(Point3D(x: 6, y: 4, z: 4) < Point3D(x: 2, y: 7, z: 3))
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
        var p = Point3D(x: 3, y: -3, z: 33)
        print(p)
        p.negate()
        XCTAssertEqual(p.x, -3)
        XCTAssertEqual(p.y, 3)
        XCTAssertEqual(p.z, -33)
        // Copy
        XCTAssertTrue(Point3D(x: -2, y: 3, z: -33) == -Point3D(x: 2, y: -3, z: 33))
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
