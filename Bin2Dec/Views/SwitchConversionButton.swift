//
//  SwitchConversionButton.swift
//  Bin2Dec
//
//  Created by Alex de la Rosa on 7/5/23.
//

import SwiftUI

struct SwitchConversionButton: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                viewModel.switchConversion()
            } label: {
                Image(systemName: "arrow.left.arrow.right")
                    .frame(height: 50.0)
                    .foregroundColor(.accentColor)
            }
            Spacer()
        }
    }
}

struct SwitchConversionbutton_Previews: PreviewProvider {
    static var previews: some View {
        SwitchConversionButton()
            .environmentObject(CalculatorViewModel())
    }
}
