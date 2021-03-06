//  TDD sample app MarvelBrowser-Swift by Jon Reid, https://qualitycoding.org/
//  Copyright 2018 Jonathan M. Reid. See LICENSE.txt

@testable import MarvelBrowserSwift
import XCTest

class CharacterResponseBuilderTests: XCTestCase {

    func testInit_WithNonStringName_ShouldCaptureNilInBuilder() {
        let dict: [String: Any] = ["name": 123]

        let sut = CharacterResponseBuilder(dictionary: dict)

        XCTAssertNil(sut.name)
    }

    func testInit_WithName_ShouldCaptureValueInBuilder() {
        let dict: [String: Any] = ["name": "NAME"]

        let sut = CharacterResponseBuilder(dictionary: dict)

        XCTAssertEqual(sut.name, "NAME")
    }

    func testBuild_WithName_ShouldHaveGivenName() {
        let dict: [String: Any] = ["name": "NAME"]
        let sut = CharacterResponseBuilder(dictionary: dict)

        let response = sut.build()

        XCTAssertEqual(response?.name, "NAME")
    }

    func testBuild_WithoutName_ShouldReturnNil() {
        let dict: [String: Any] = [:]
        let sut = CharacterResponseBuilder(dictionary: dict)

        let response = sut.build()

        XCTAssertNil(response)
    }
}
