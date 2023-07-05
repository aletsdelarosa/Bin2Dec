//
//  ValueRow.swift
//  Bin2Dec
//
//  Created by Alex de la Rosa on 7/5/23.
//

import SwiftUI

struct ValueRow: View {
    let resultTitle: String
    let resultValue: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(resultTitle)
                .font(.title3)
                .fontWeight(.semibold)
            Text(resultValue)
                .textSelection(.enabled)
        }
    }
}

struct ValueRow_Previews: PreviewProvider {
    static var previews: some View {
        ValueRow(resultTitle: "Decimal", resultValue: "0")
    }
}
