//
//  ContentView.swift
//  converter_currency
//
//  Created by Julian González on 28/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currencyLeft = ""
    @State private var currencyRight = ""
    
    @State var currencyFrom: Currency = .silverPiece
    @State var currencyTo: Currency = .goldPiece
    
    @State private var showExchangeInfo = false
    @State private var showSelectCurrency = false
    
    @FocusState var currencyLeftFocusState
    @FocusState var currencyRightFocusState
    
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
                        
                        TextField("Amount from", text: $currencyLeft)
                            .textFieldStyle(.roundedBorder)
                            .focused($currencyLeftFocusState)
                            .onChange(of: currencyLeft) {
                                if currencyLeftFocusState {
                                    currencyRight = currencyFrom
                                        .convert(amountString: currencyLeft, currencyTo: currencyTo)
                                }
                            }
                            .onTapGesture {
                                currencyLeft = ""
                                currencyRight = ""
                            }
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
                        
                        TextField("Amount to", text: $currencyRight)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($currencyRightFocusState)
                            .onChange(of: currencyRight) {
                                if currencyRightFocusState {
                                    currencyLeft = currencyTo
                                        .convert(amountString: currencyRight, currencyTo: currencyFrom)
                                }
                            }
                        
                    }
                }
                .padding()
                .background(.black.opacity(0.3))
                .clipShape(.rect(cornerRadius: 20))
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
