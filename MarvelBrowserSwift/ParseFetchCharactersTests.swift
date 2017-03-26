//  TDD sample app MarvelBrowser-Swift by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 Jonathan M. Reid. See LICENSE.txt

import XCTest
@testable import MarvelBrowserSwift

class ParseFetchCharactersTests: XCTestCase {

    private func jsonData(_ json: String) -> Data {
        return json.data(using: .utf8)!
    }

    func testParse_WithCode200_ShouldReturnSuccess() {
        let json = "{\"code\":200}"

        let response = parseFetchCharacters(jsonData: jsonData(json))

        switch response {
        case .success(_):
            break
        default:
            XCTFail("Expected success, got \(response)")
        }
    }

    func testParse_WithCode409AndStatus_ShouldReturnFailureWithStatus() {
        let json =
                "{" +
                    "\"code\":409," +
                    "\"status\":\"STATUS\"" +
                "}"

        let response = parseFetchCharacters(jsonData: jsonData(json))

        switch response {
        case let .failure(status):
            XCTAssertEqual(status, "STATUS")
        default:
            XCTFail("Expected failure, got \(response)")
        }
    }

    func testParse_WithMalformedJSON_ShouldReturnBadJSONFailure() {
        let json =
                "{" +
                    "\"cod"

        let response = parseFetchCharacters(jsonData: jsonData(json))

        switch response {
        case let .failure(status):
            XCTAssertEqual(status, "Bad JSON")
        default:
            XCTFail("Expected failure, got \(response)")
        }
    }

    func testParse_WithJSONArrayInsteadOfDictionary_ShouldReturnBadJSONFailure() {
        let json = "[]"

        let response = parseFetchCharacters(jsonData: jsonData(json))

        switch response {
        case let .failure(status):
            XCTAssertEqual(status, "Bad JSON")
        default:
            XCTFail("Expected failure, got \(response)")
        }
    }

    func testParse_WithNonIntegerCode_ShouldReturnBadJSONFailure() {
        let json =
                "{" +
                    "\"code\":\"409\"," +
                    "\"status\":\"STATUS\"" +
                "}"

        let response = parseFetchCharacters(jsonData: jsonData(json))

        switch response {
        case let .failure(status):
            XCTAssertEqual(status, "Bad JSON")
        default:
            XCTFail("Expected failure, got \(response)")
        }
    }

func testParse_WithValidFailureCodeButNoStatus_ShouldReturnBadJSONFailure() {
        let json =
                "{" +
                    "\"code\":409" +
                "}"

        let response = parseFetchCharacters(jsonData: jsonData(json))

        switch response {
        case let .failure(status):
            XCTAssertEqual(status, "Bad JSON")
        default:
            XCTFail("Expected failure, got \(response)")
        }
    }

}
