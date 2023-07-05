//
//  ResultsSection.swift
//  Bin2Dec
//
//  Created by Alex de la Rosa on 7/5/23.
//

import SwiftUI

struct ResultsSection: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ValueRow(resultTitle: viewModel.resultTitleString, resultValue: viewModel.resultString)
                
                Divider()
                
                ValueRow(resultTitle: "Octal", resultValue: viewModel.octalString)
                
                Divider()
                
                ValueRow(resultTitle: "Hexadecimal", resultValue: viewModel.hexadecimalString)
            }
            Spacer()
        }
        .padding()
        .background(Color("SectionBackground"))
        .cornerRadius(10.0)
        .padding(.horizontal)
    }
}

struct ResultsSection_Previews: PreviewProvider {
    static var previews: some View {
        ResultsSection()
            .environmentObject(CalculatorViewModel())
    }
}
