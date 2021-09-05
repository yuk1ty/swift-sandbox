import XCTest

import AWSLambdaTests

var tests = [XCTestCaseEntry]()
tests += AWSLambdaTests.allTests()
XCTMain(tests)
