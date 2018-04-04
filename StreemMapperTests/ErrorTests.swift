import XCTest
@testable import StreemMapper

final class ErrorTests: XCTestCase {
    func testTypeMismatch() {
        struct Test: Mappable {
            init(map: Mapper) throws {}
        }

        do {
            let map = Mapper(JSON: ["field": 1])
            let _: Test = try map.from(field: "field")
            XCTFail("Type mismatch should throw")
        } catch MapperError.typeMismatchError(let field, let value, let type) {
            XCTAssert(field == "field")
            XCTAssert(value as? Int == 1)
            XCTAssert(type == [AnyHashable: Any].self)
        } catch {
            XCTFail("Type mismatch threw the wrong error")
        }
    }

    func testInvalidRawValue() {
        enum Suit: String {
            case spades
        }

        do {
            let map = Mapper(JSON: ["suit": "hearts"])
            let _: Suit = try map.from(field: "suit")
            XCTFail("Invalid raw should throw")
        } catch MapperError.invalidRawValueError(let field, let value, let type) {
            XCTAssert(field == "suit")
            XCTAssert(value as? String == "hearts")
            XCTAssert(type == Suit.self)
        } catch {
            XCTFail("Invalid raw threw the wrong error")
        }
    }

    func testConvertibleError() {
        do {
            let map = Mapper(JSON: ["url": 1])
            let _: URL = try map.from(field: "url")
            XCTFail("Convertible parsing should throw")
        } catch MapperError.convertibleError(let value, let type) {
            XCTAssert(value as? Int == 1)
            XCTAssert(type == String.self)
        } catch {
            XCTFail("Convertible parsing threw the wrong error")
        }
    }

    func testMissingField() {
        do {
            let map = Mapper(JSON: [:])
            let _: String = try map.from(field: "string")
            XCTFail("Missing field parsing should throw")
        } catch MapperError.missingFieldError(let field) {
            XCTAssert(field == "string")
        } catch {
            XCTFail("Missing field parsing threw the wrong erro")
        }
    }

    func testCustomError() {
        do {
            let map = Mapper(JSON: ["string": "hi"])
            _ = try map.from(field: "string", transformation: { _ in
                throw MapperError.customError(field: "string", message: "hi")
            })

            XCTFail("Custom error should throw")
        } catch MapperError.customError(let field, let message) {
            XCTAssert(field == "string")
            XCTAssert(message == "hi")
        } catch {
            XCTFail("Custom error didn't throw custom error")
        }
    }
}
