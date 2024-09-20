import XCTest
@testable import FunctionCalling_GoogleGenerativeAI
import FunctionCalling

final class FunctionCalling_GoogleGenerativeAITests: XCTestCase {
    @FunctionCalling(service: .claude)
    struct FunctionContainer {
        /// Return current weather of location that passed by the argument
        /// - Parameter location: location that I want to know how the weather
        /// - Returns: string of weather
        @CallableFunction
        func getWeather(location: String) -> String {
            return "Sunny"
        }

        @CallableFunction
        func getStock(args: String) -> Int {
            return 0
        }
    }

    func testConvertedResults() throws {
        guard let functions = FunctionContainer().googleGenerativeAITools.first?.functions else {
            XCTFail("Conainer should contain some functions")
            return
        }

        XCTAssertEqual(functions.count, 2)

        let getWeather = try XCTUnwrap(functions.first)
        XCTAssertEqual(getWeather.getName(), "getWeather")
        XCTAssertEqual(getWeather.getDescription(), "Return current weather of location that passed by the argument- Parameter location: location that I want to know how the weather- Returns: string of weather")

        let getStock = try XCTUnwrap(functions.last)
        XCTAssertEqual(getStock.getName(), "getStock")
        XCTAssertEqual(getStock.getDescription(), "")
    }
}
