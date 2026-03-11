//
//  ContentView.swift
//  ExchangeRates
//
//  Created by Mayara Ferreira de Oliveira on 04/03/26.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Button {
                doFetchData()
            } label: {
                Image(systemName: "network")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
        }
        .padding()
    }
    
    private func doFetchData() {
        let rateFluctuationDataProvider = RatesFluctuationDataProvider()
        rateFluctuationDataProvider.delegate = self
        rateFluctuationDataProvider.fetchFluctuation(by: "BRL", from: ["USD", "EUR"], startDate: "2022-10-11", endDate: "2022-11-11")
        
        let currencySymbolDataProvider = CurrencySymbolsDataProvider()
        currencySymbolDataProvider.delegate = self
        currencySymbolDataProvider.fetchSymbols()
        
        let rateHistoricalDataProvider = RatesHistoricalDataProvider()
        rateHistoricalDataProvider.delegate = self
        rateHistoricalDataProvider.fetchTimeseries(by: "BRL", from: ["USD", "EUR"], startDate: "2022-10-11", endDate: "2022-11-11")
    }

}

extension ContentView: RatesFluctuationDataProviderDelegate {

    func success(model: RatesFluctuationObject) {
        print("RatesFluctuationModel: \(model)\n\n")
    }

}

extension ContentView: CurrencySymbolsDataProviderDelegate {

    func success(model: CurrencySymbolObject) {
        print("CurrencySymbolsDataProviderDelegate: \(model)\n\n")
    }

}

extension ContentView: RatesHistoricalDataProviderDelegate {

    func success(model: RatesHistoricalObject) {
        print("RatesHistoricalModel: \(model)\n\n")
    }

}

#Preview {
    ContentView()
}
