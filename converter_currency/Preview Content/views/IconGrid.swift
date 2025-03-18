//
//  IconGrid.swift
//  converter_currency
//
//  Created by Julian González on 17/03/25.
//

import SwiftUI

struct IconGrid: View {
    @State var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
            ForEach(Currency.allCases) { currency in
                CurrencyIcon(image: currency.image, name: currency.name)
                    .shadow(color: .black,  radius: 5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: self.currency == currency ? 3 : 0)
                            .opacity(0.5)
                    }
                    .onTapGesture {
                        self.currency = currency
                    }
            }
        }
    }
}

#Preview {
    IconGrid(currency: .silverPenny)
}
