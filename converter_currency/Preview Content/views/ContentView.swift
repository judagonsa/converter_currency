//
//  ContentView.swift
//  converter_currency
//
//  Created by Julian González on 28/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amountSilver = ""
    @State private var amountGolden = ""
    
    @State var currencyFrom: Currency = .silverPiece
    @State var currencyTo: Currency = .goldPiece
    
    @State private var showExchangeInfo = false
    @State private var showSelectCurrency = false
    
    var body: some View {

        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency exchange converter")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)

                HStack {
                    VStack {
                        HStack {
                            Image(currencyFrom.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            Text(currencyFrom.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        TextField("Amount", text: $amountSilver)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        HStack {
                            Text(currencyTo.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(currencyTo.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        TextField("Amount", text: $amountGolden)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.3))
                .clipShape(.buttonBorder)
                .padding(10)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing, 20)
                }
            }
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(currencyFrom: $currencyFrom, currencyTo: $currencyTo)
        }
    }
}

#Preview {
    ContentView()
}
