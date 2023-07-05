//
//  ConversionSection.swift
//  Bin2Dec
//
//  Created by Alex de la Rosa on 7/5/23.
//

import SwiftUI

struct ConversionSection: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ValueRow(resultTitle: viewModel.conversionTitleString, resultValue: viewModel.conversionString)
            }
            Spacer()
        }
        .padding()
        .background(Color("SectionBackground"))
        .cornerRadius(10.0)
        .padding(.horizontal)
    }
}

struct ConversionSection_Previews: PreviewProvider {
    static var previews: some View {
        ConversionSection()
            .environmentObject(CalculatorViewModel())
    }
}
