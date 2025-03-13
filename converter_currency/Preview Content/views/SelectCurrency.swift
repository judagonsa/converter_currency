//
//  SelectCurrency.swift
//  converter_currency
//
//  Created by Julian González on 12/03/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            
            VStack {
                Text("Select de currency you are starting with:")
                    .fontWeight(.bold)
                
                
                CurrencyIcon(image: .goldpenny, name: "Golden Peny")
                
                
                Text("Select de currency you would like to convert to:")
                    .fontWeight(.bold)
                
                
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
    SelectCurrency()
}


