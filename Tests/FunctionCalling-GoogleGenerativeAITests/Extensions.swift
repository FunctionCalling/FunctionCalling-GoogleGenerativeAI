//
//  Extensions.swift
//  FunctionCalling-GoogleGenerativeAI
//
//  Created by 伊藤史 on 2024/09/20.
//

@testable import GoogleGenerativeAI

extension GoogleGenerativeAI.Tool {
    var functions: [FunctionDeclaration]? {
        self.functionDeclarations
    }
}

extension GoogleGenerativeAI.FunctionDeclaration {
    func getName() -> String {
        self.name
    }

    func getDescription() -> String? {
        self.description
    }
}
