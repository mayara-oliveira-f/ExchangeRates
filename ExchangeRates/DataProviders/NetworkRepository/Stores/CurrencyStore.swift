//
//  CurrencyStore.swift
//  ExchangeRates
//
//  Created by Mayara Ferreira de Oliveira on 08/03/26.
//

import Foundation

protocol CurrencyStoreProtocol {
    func fetchSymbols() async throws -> CurrencySymbolObject
}

class CurrencyStore: BaseStore, CurrencyStoreProtocol {

    func fetchSymbols() async throws -> CurrencySymbolObject {
        guard let urlRequest = try CurrencyRouter.symbols.asURLRequest() else { throw error }
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let symbols = try SymbolResult(data: data, response: response).symbols else { throw error }
        return symbols
    }

}
