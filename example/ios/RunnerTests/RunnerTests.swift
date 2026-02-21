import Flutter
import UIKit
import XCTest

@testable import flutter_get_app_group_directory

// Unit tests for the iOS native implementation of FlutterGetAppGroupDirectoryPlugin.
class RunnerTests: XCTestCase {

  // MARK: - get

  func testGetInvalidArguments_missingIdentifier() {
    let plugin = FlutterGetAppGroupDirectoryPlugin()
    let call = FlutterMethodCall(methodName: "get", arguments: nil)

    let resultExpectation = expectation(description: "result block must be called.")
    plugin.handle(call) { result in
      XCTAssertTrue(result is FlutterError, "Expected FlutterError for missing arguments")
      let error = result as! FlutterError
      XCTAssertEqual(error.code, "INVALID_ARGUMENTS")
      resultExpectation.fulfill()
    }
    waitForExpectations(timeout: 1)
  }

  func testGetInvalidArguments_wrongType() {
    let plugin = FlutterGetAppGroupDirectoryPlugin()
    let call = FlutterMethodCall(methodName: "get", arguments: ["identifier": 42])

    let resultExpectation = expectation(description: "result block must be called.")
    plugin.handle(call) { result in
      XCTAssertTrue(result is FlutterError, "Expected FlutterError for wrong argument type")
      let error = result as! FlutterError
      XCTAssertEqual(error.code, "INVALID_ARGUMENTS")
      resultExpectation.fulfill()
    }
    waitForExpectations(timeout: 1)
  }

  func testGetInvalidGroupId_returnsAppGroupNotFoundError() {
    let plugin = FlutterGetAppGroupDirectoryPlugin()
    // An arbitrary string that is not a registered App Group on this device
    let call = FlutterMethodCall(
      methodName: "get",
      arguments: ["identifier": "group.com.example.nonexistent.unittest"]
    )

    let resultExpectation = expectation(description: "result block must be called.")
    plugin.handle(call) { result in
      // On a simulator/device without this group configured the result is a FlutterError
      XCTAssertTrue(result is FlutterError, "Expected FlutterError for unknown group ID")
      let error = result as! FlutterError
      XCTAssertEqual(error.code, "APP_GROUP_NOT_FOUND")
      resultExpectation.fulfill()
    }
    waitForExpectations(timeout: 1)
  }

  func testGetUnknownMethod_returnsNotImplemented() {
    let plugin = FlutterGetAppGroupDirectoryPlugin()
    let call = FlutterMethodCall(methodName: "unknownMethod", arguments: nil)

    let resultExpectation = expectation(description: "result block must be called.")
    plugin.handle(call) { result in
      XCTAssertTrue(
        result is NSObject && (result as! NSObject) == FlutterMethodNotImplemented,
        "Expected FlutterMethodNotImplemented for unknown method"
      )
      resultExpectation.fulfill()
    }
    waitForExpectations(timeout: 1)
  }
}
