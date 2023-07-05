//
//  Keyboard.swift
//  Bin2Dec
//
//  Created by Alex de la Rosa on 7/5/23.
//

import SwiftUI

struct Keyboard: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    
    @ViewBuilder
    var body: some View {
        switch viewModel.conversionType {
        case .binaryToDecimal:
            BinaryKeyboard()
        case .decimalToBinary:
            DecimalKeyboard()
        }
    }
}

fileprivate struct DecimalKeyboard: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], alignment: .center) {
            Group {
                NumberButton(text: "1")
                NumberButton(text: "2")
                NumberButton(text: "3")
            }
            Group {
                NumberButton(text: "4")
                NumberButton(text: "5")
                NumberButton(text: "6")
            }
            Group {
                NumberButton(text: "7")
                NumberButton(text: "8")
                NumberButton(text: "9")
            }
            Group {
                EmptySpace()
                NumberButton(text: "0")
                EmptySpace()
            }
        }
        .padding()
    }
}

fileprivate struct BinaryKeyboard: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()], alignment: .center) {
            Group {
                NumberButton(text: "0")
                NumberButton(text: "1")
            }
        }
        .padding()
    }
}

fileprivate struct EmptySpace: View {
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(maxWidth: .infinity)
            .frame(height: 50.0)
    }
}

fileprivate struct NumberButton: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    
    let text: String
    
    var body: some View {
        Button {
            viewModel.append(number: text)
        } label: {
            Text(text)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50.0)
                .background(Color.accentColor)
                .cornerRadius(10.0)
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        let binaryVM = CalculatorViewModel()
        let decimalVM = CalculatorViewModel()
        
        binaryVM.conversionType = .binaryToDecimal
        decimalVM.conversionType = .decimalToBinary
        
        return Group {
            Keyboard()
                .environmentObject(binaryVM)
            
            Keyboard()
                .environmentObject(decimalVM)
        }
    }
}
