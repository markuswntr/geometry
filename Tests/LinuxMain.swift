import XCTest
@testable import GeometryTests

XCTMain([
    testCase(Point2DTests.allTests),
    testCase(Point3DTests.allTests)
])
