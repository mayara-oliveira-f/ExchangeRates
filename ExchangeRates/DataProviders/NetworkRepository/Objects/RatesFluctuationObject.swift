//
//  RatesFluctuationObject.swift
//  ExchangeRates
//
//  Created by Mayara Ferreira de Oliveira on 08/03/26.
//

import Foundation

typealias RatesFluctuationObject = [String: FluctuationObject]

struct FluctuationObject: Codable {

    let change: Double
    let changePct: Double
    let endRate: Double
    
    enum CodingKeys: String, CodingKey {
        case change
        case changePct = "change_pct"
        case endRate = "end_rate"
    }

}
