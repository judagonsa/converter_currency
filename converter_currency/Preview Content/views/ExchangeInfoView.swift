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
                
                Text("En esta App, entendemos que cambiar moneda puede ser una parte importante de tus viajes o transacciones internacionales. Por eso, nos esforzamos por ofrecerte una experiencia fácil y conveniente. Contamos con una amplia variedad de monedas extranjeras disponibles y actualizamos nuestros tipos de cambio constantemente para asegurarnos de que obtengas el mejor precio posible. Nuestro personal experto está aquí para responder a tus preguntas y ayudarte con cualquier duda que puedas tener. ¡Ven y descubre la diferencia de [Nombre de la Casa de Cambio")
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
                    leftImage: .silverpiece,
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
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.title2)
                .padding()
                .foregroundStyle(.white)
                
            }
            .foregroundStyle(.black)
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
