//
//  CurrencyTip.swift
//  converter_currency
//
//  Created by Julian González on 15/02/26.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Cambiar moneda")
    
    var message: Text? {
        Text("Aquí podras cambiar el tipo de moneda")
    }
    
    var image: Image? {
        Image(systemName: "hand.tap.fill")
    }
    
}
