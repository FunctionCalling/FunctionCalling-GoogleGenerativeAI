// The Swift Programming Language
// https://docs.swift.org/swift-book

import FunctionCalling
import GoogleGenerativeAI
import Foundation

typealias FunctionCallingTool = FunctionCalling.Tool

extension ToolContainer {
    public var googleGenerativeAITools: [GoogleGenerativeAI.Tool] {
        get throws {
            let data = allTools.data(using: .utf8)!
            let functionCallingTools = try JSONDecoder().decode([FunctionCallingTool].self, from: data)
            let googleGenerativeAITools = functionCallingTools.map { $0.toFunctionDeclaration }

            return [GoogleGenerativeAI.Tool(functionDeclarations: googleGenerativeAITools)]
        }
    }
}
