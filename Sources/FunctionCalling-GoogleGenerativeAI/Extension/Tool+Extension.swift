//
//  Tool+Extension.swift
//
//
//  Created by 伊藤史 on 2024/09/13.
//

import FunctionCalling
import GoogleGenerativeAI

extension FunctionCalling.Tool {
    var toFunctionDeclaration: GoogleGenerativeAI.FunctionDeclaration {
        FunctionDeclaration(
            name: name,
            description: description,
            parameters: inputSchema.properties?.mapValues { $0.toSchema },
            requiredParameters: inputSchema.requiredProperties
        )
    }
}
