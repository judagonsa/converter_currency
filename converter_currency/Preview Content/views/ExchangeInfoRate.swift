//
//  ExchangeInfoRateView.swift
//  converter_currency
//
//  Created by Julian González on 12/03/25.
//

import SwiftUI

struct ExchangeInfoRate: View {
    
    let leftImage: ImageResource
    let textExchange: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(textExchange)
                .font(.footnote)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeInfoRate(leftImage: .goldpenny, textExchange: "Texto", rightImage: .goldpiece)
}
