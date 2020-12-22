//
//  NomuraViewModelTests.swift
//  NomuraTestTests
//
//  Created by Akif Demirezen on 11/12/20.
//  Copyright © 2020 Akif Demirezen. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import NomuraTest

class NomuraViewModelTests: XCTestCase {
    var promise: XCTestExpectation?
    var expectedError: String?
    var errorFile: String?
    override func setUp() {}
    override func tearDown() {
        HTTPStubs.removeAllStubs()
        errorFile = nil
        expectedError = nil
    }
    func matcher(request: URLRequest) -> Bool {
        if ProcessInfo.processInfo.environment["Mock-API"] == "false" {
            return false
        }
        return request.url?.host == APIConstants.baseURL.replacingOccurrences(of: "https:", with: "").replacingOccurrences(of: "/", with: "")
    }
    func provider(request: URLRequest) -> HTTPStubsResponse {
        var fileName = ""
        if let requestPath = request.url?.path, let name = requestPath.components(separatedBy: "/").last {
            fileName = "\(name).json"
        }
        let stubPath = OHPathForFile(fileName, type(of: self))
        return fixture(filePath: stubPath!, headers: ["Content-Type": APIConstants.contentType, "X-RapidAPI-Key": APIConstants.keyValue, "X-RapidAPI-Host": APIConstants.baseURL.replacingOccurrences(of:"https://" , with: "")])
    }
    func errorProvider(request: URLRequest) -> HTTPStubsResponse {
        guard var fileName = errorFile else {
            fatalError()
        }
        fileName = "\(fileName).json"
        let stubPath = OHPathForFile(fileName, type(of: self))
        return fixture(filePath: stubPath!, headers: ["Content-Type": APIConstants.contentType, "X-RapidAPI-Key": APIConstants.keyValue, "X-RapidAPI-Host": APIConstants.baseURL.replacingOccurrences(of:"https://" , with: "")])
    }
}
class StepViewModelTest: NomuraViewModelTests {
    var step: String?
    override func tearDown() {
        super.tearDown()
        step = nil
    }
    func stepProvider(request: URLRequest) -> HTTPStubsResponse {
        var fileName = ""
        if let requestPath = request.url?.path, let name = requestPath.components(separatedBy: "/").last, let stepName = step {
            fileName = "\(name)_\(stepName).json"
        }
        let stubPath = OHPathForFile(fileName, type(of: self))
        return fixture(filePath: stubPath!, headers: ["Content-Type": APIConstants.contentType])
    }
}
