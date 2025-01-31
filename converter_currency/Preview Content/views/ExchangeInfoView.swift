//
//  ExchangeInfoView.swift
//  converter_currency
//
//  Created by Julian González on 30/01/25.
//

import SwiftUI

struct ExchangeInfoView: View {
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Exchange rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                Text("Aquí la información")
                    .padding()
                
                InfoRateView(
                    leftImage: .goldpiece,
                    textExchange: "1 Golden piece = 4 Golden penines",
                    rightImage: .goldpenny
                )
                
                InfoRateView(
                    leftImage: .goldpenny,
                    textExchange: "1 Golden penny = 4 Silver pieces",
                    rightImage: .silverpiece
                )
                
                InfoRateView(
                    leftImage: .silverpenny,
                    textExchange: "1 Silver piece = 4 Silver penines",
                    rightImage: .silverpenny
                )
                
                InfoRateView(
                    leftImage: .silverpenny,
                    textExchange: "1 Silver penny = 100 Copper penines",
                    rightImage: .copperpenny
                )
                
                Button("Done") {
                    
                }
                .buttonStyle(.bordered)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.title2)
                .padding()
                
            }
        }
        .background(.brown)
    }
}

#Preview {
    ExchangeInfoView()
}

struct InfoRateView: View {
    
    var leftImage: ImageResource
    var textExchange: String
    var rightImage: ImageResource
    
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
