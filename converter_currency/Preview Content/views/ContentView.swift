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
    @State private var showExchangeInfo = false
    
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
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            Text("Silver price")
                                .font(.headline)
                                .foregroundStyle(.white)
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
                            Text("Golden price")
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
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
    }
}

#Preview {
    ContentView()
}
