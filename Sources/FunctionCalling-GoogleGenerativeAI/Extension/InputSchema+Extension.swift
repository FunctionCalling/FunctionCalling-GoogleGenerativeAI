//
//  InputSchema+Extension.swift
//
//
//  Created by 伊藤史 on 2024/09/13.
//

import FunctionCalling
import GoogleGenerativeAI

extension FunctionCalling.InputSchema {
    var toSchema: GoogleGenerativeAI.Schema {
        Schema(
            type: type.toDataType,
            format: format,
            description: description,
            nullable: nullable,
            enumValues: enumValues,
            items: items?.toSchema,
            properties: properties?.mapValues { $0.toSchema },
            requiredProperties: requiredProperties
        )
    }
}

extension FunctionCalling.InputSchema.DataType {
    var toDataType: GoogleGenerativeAI.DataType {
        switch self {
        case .string:
            return .string
        case .number:
            return .number
        case .integer:
            return .integer
        case .boolean:
            return .boolean
        case .array:
            return .array
        case .object:
            return .object
        }
    }
}
