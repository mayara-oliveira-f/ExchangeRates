//
//  RatesRouter.swift
//  ExchangeRates
//
//  Created by Mayara Ferreira de Oliveira on 08/03/26.
//

import Foundation

enum RatesRouter {
    case fluctuation(base: String, symbols: [String], startDate: String, endDate: String)
    case timeseries(base: String, symbols: [String], startDate: String, endDate: String)
    
    var path: String {
        switch self {
            case .fluctuation: return RatesApi.fluctuation
            case .timeseries: return RatesApi.timeseries
        }
    }
    
    func asURLRequest() throws -> URLRequest? {
        guard var url = URL(string: RatesApi.baseURL) else { return nil }
        
        switch self {
            case .fluctuation(let base, let symbols, let startDate, let endDate):
                url.append(queryItems: [
                    URLQueryItem(name: "base", value: base),
                    URLQueryItem(name: "symbols", value: symbols.joined(separator: ",")),
                    URLQueryItem(name: "start_date", value: startDate),
                    URLQueryItem(name: "end_date", value: endDate)
                ])
            case .timeseries(let base, let symbols, let startDate, let endDate):
                url.append(queryItems: [
                    URLQueryItem(name: "base", value: base),
                    URLQueryItem(name: "symbols", value: symbols.joined(separator: ",")),
                    URLQueryItem(name: "start_date", value: startDate),
                    URLQueryItem(name: "end_date", value: endDate)
                ])
        }
        
        var request = URLRequest(url: url.appendingPathComponent(path), timeoutInterval: Double.infinity)
        request.httpMethod = HttpMethod.get.rawValue
        request.addValue(RatesApi.apiKey, forHTTPHeaderField: "apiKey")
        
        return request
    }
}
