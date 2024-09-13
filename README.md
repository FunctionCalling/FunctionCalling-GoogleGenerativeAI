# FunctionCalling-GoogleGenerativeAI

This library simplifies the integration of the [FunctionCalling](https://github.com/fumito-ito/FunctionCalling) macro into [GoogleGenerativeAI](https://github.com/google-gemini/generative-ai-swift). By using this library, you can directly generate `Tool` objects from Swift native functions, which can then be specified as FunctionCalling when invoking VertexAI.

## Usage

```swift

import FunctionCalling
import FunctionCalling_GoogleGenerativeAI
import GoogleGenerativeAI

// MARK: Declare the container and functions for the tools to be called from FunctionCalling.

@FunctionCalling(service: .llamaOrGemini)
struct MyFunctionTools {
    @CallableFunction
    /// Get the current stock price for a given ticker symbol
    ///
    /// - Parameter: The stock ticker symbol, e.g. GOOG for Google Inc.
    func getStockPrice(ticker: String) async throws -> String {
        // code to return stock price of passed ticker
    }
}

// MARK: You can directly pass the tools generated from objects to the model in VertexAI.

let model = GenerativeModel(
    modelName: "gemini-1.5-flash",
    tools: MyFunctionTools().googleGenerativeAITools
)
```

## Installation

### Swift Package Manager

```
let package = Package(
    name: "MyPackage",
    products: [...],
    targets: [
        .target(
            "YouAppModule",
            dependencies: [
                .product(name: "FunctionCalling-GoogleGenerativeAI", package: "FunctionCalling-GoogleGenerativeAI")
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/fumito-ito/FunctionCalling-GoogleGenerativeAI", from: "0.0.1")
    ]
)
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.Please make sure to update tests as appropriate.

## License

The MIT License
