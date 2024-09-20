// The Swift Programming Language
// https://docs.swift.org/swift-book

import FunctionCalling
import GoogleGenerativeAI
import Foundation

typealias FunctionCallingTool = FunctionCalling.Tool

extension ToolContainer {
    public var googleGenerativeAITools: [GoogleGenerativeAI.Tool] {
        [
            GoogleGenerativeAI.Tool(
                functionDeclarations: allTools?.compactMap { $0.toFunctionDeclaration }
            )
        ]
    }
}
