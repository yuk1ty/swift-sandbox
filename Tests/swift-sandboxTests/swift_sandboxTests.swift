import XCTest
@testable import swift_sandbox

final class swift_sandboxTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_sandbox().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
