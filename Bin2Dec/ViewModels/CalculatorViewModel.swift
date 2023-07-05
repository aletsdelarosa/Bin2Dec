//
//  CalculatorViewModel.swift
//  Bin2Dec
//
//  Created by Alex de la Rosa on 7/5/23.
//

import Foundation

enum ConversionType {
    case binaryToDecimal
    case decimalToBinary
    
    func toggle() -> ConversionType {
        switch self {
        case .binaryToDecimal:
            return .decimalToBinary
        case .decimalToBinary:
            return .binaryToDecimal
        }
    }
}

class CalculatorViewModel: ObservableObject {
    @Published var conversionType: ConversionType = .binaryToDecimal
    @Published var conversionTitleString: String = "Binary"
    @Published var conversionString: String = "0"
    @Published var resultTitleString: String = "Decimal"
    @Published var resultString: String = "0"
    @Published var octalString: String = "0"
    @Published var hexadecimalString: String = "0"
    
    private var calculator = Calculator()
    
    func append(number: String) {
        calculator.append(number: number, conversionType: conversionType)
        
        setValues()
    }
    
    func switchConversion() {
        conversionType = conversionType.toggle()
        
        reset()
        
        setTitles()
    }
    
    func reset() {
        calculator.reset()
        
        setValues()
    }
    
    private func setTitles() {
        conversionTitleString = conversionType == .binaryToDecimal ? "Binary" : "Decimal"
        resultTitleString = conversionType == .binaryToDecimal ? "Decimal" : "Binary"
    }
    
    private func setValues() {
        conversionString = conversionType == .binaryToDecimal ?
            calculator.convert(to: .binary) : calculator.convert(to: .decimal)
        
        resultString = conversionType == .binaryToDecimal ?
            calculator.convert(to: .decimal) : calculator.convert(to: .binary)
        
        octalString = calculator.convert(to: .octal)
        
        hexadecimalString = calculator.convert(to: .hexadecimal)
    }
}
