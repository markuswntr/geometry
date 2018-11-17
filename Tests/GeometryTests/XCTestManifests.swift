import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Poin2Tests.allTests)
    ]
}
#endif
