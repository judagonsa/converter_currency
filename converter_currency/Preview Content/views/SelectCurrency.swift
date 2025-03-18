//
//  SelectCurrency.swift
//  converter_currency
//
//  Created by Julian González on 12/03/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    @State var currency: Currency
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack {
                Text("Select de currency you are starting with:")
                    .fontWeight(.bold)
                
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
                
                Text("Select de currency you would like to convert to:")
                    .fontWeight(.bold)
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
                    ForEach(Currency.allCases) { currency in
                        CurrencyIcon(image: currency.image, name: currency.name)
                    }
                }
                
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.title2)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(currency: .silverPenny)
}


