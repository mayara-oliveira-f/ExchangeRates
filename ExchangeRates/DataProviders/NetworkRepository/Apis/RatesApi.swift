//
//  RatesApi.swift
//  ExchangeRates
//
//  Created by Mayara Ferreira de Oliveira on 08/03/26.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

struct RatesApi {

    static let baseURL = "https://api.apilayer.com/exchangerates_data"
    static let apiKey = "sEbojINyVGO6yOuRvqcL3ofKaLwu2K3a"
    static let fluctuation = "/fluctuation"
    static let symbols = "/symbols"
    static let timeseries = "/timeseries"

}
