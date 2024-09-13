// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FunctionCalling-GoogleGenerativeAI",
    platforms: [
        .macOS(.v13),
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FunctionCalling-GoogleGenerativeAI",
            targets: ["FunctionCalling-GoogleGenerativeAI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/google-gemini/generative-ai-swift", from: "0.5.6"),
        .package(url: "https://github.com/fumito-ito/FunctionCalling", from: "0.3.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FunctionCalling-GoogleGenerativeAI",
            dependencies: [
                .product(name: "GoogleGenerativeAI", package: "generative-ai-swift"),
                .product(name: "FunctionCalling", package: "FunctionCalling"),
            ]
        ),
        .testTarget(
            name: "FunctionCalling-GoogleGenerativeAITests",
            dependencies: ["FunctionCalling-GoogleGenerativeAI"]),
    ]
)
