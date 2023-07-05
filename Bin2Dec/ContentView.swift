//
//  ContentView.swift
//  Bin2Dec
//
//  Created by Alex de la Rosa on 7/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ConversionSection()
                
                SwitchConversionButton()
                
                ResultsSection()
                
                Spacer()
                
                Keyboard()
            }
            .navigationTitle("Bin2Dec")
            .background(Color(UIColor.systemGroupedBackground))
        }
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
