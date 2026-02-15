//
//  SelectCurrency.swift
//  converter_currency
//
//  Created by Julian González on 12/03/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var currencyFrom: Currency
    @Binding var currencyTo: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack {
                Text("Select de currency you are starting with:")
                    .fontWeight(.bold)
                
                IconGrid(currency: $currencyFrom)
                
                Text("Select de currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                IconGrid(currency: $currencyTo)
                
                HStack() {
                    Text("Done")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.brown.mix(with: .black, by: 0.2))
                .font(.title2)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.vertical)
                .onTapGesture {
                    dismiss()
                }
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var currencyFrom: Currency = .silverPiece
    @Previewable @State var currencyTo: Currency = .goldPiece
    
    
    SelectCurrency(currencyFrom: $currencyFrom, currencyTo: $currencyTo)
}


