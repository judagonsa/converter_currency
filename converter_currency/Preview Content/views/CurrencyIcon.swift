//
//  CurrencyIconView.swift
//  converter_currency
//
//  Created by Julian González on 12/03/25.
//

import SwiftUI

struct CurrencyIcon: View {
    let image: ImageResource
    let name: String
    
    var body: some View {

        ZStack(alignment: .bottom) {
            Image(image)
                .resizable()
                .scaledToFit()
            Text(name)
                .padding(2)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown)
        }
        .padding(5)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    CurrencyIcon(image: .goldpenny, name: "Golden Penny")
}
