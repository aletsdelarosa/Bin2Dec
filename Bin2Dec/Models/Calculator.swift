//
//  Calculator.swift
//  Bin2Dec
//
//  Created by Alex de la Rosa on 7/5/23.
//

import Foundation

enum ConversionOption: Int {
    case binary = 2
    case octal = 8
    case decimal = 10
    case hexadecimal = 16
}

class Calculator {
    private var currentValue: UInt = 0
    
    func convert(to value: ConversionOption) -> String {
        return String(currentValue, radix: value.rawValue)
    }
    
    func append(number: String, conversionType: ConversionType) {
        switch conversionType {
        case .binaryToDecimal:
            calculateBinaryNumber(number: number)
        case .decimalToBinary:
            calculateDecimalNumber(number: number)
        }
    }
    
    func reset() {
        currentValue = 0
    }
    
    private func calculateBinaryNumber(number: String) {
        var conversionString = "\(convert(to: .binary))\(number)"

        if currentValue == 0 {
            conversionString = "\(number)"
        }
        
        if let value = UInt(conversionString, radix: 2) {
            currentValue = value
        }
    }
    
    private func calculateDecimalNumber(number: String) {
        var conversionString = "\(currentValue)\(number)"

        if currentValue == 0 {
            conversionString = "\(number)"
        }
        
        if let value = UInt(conversionString) {
            currentValue = value
        }
    }
}
