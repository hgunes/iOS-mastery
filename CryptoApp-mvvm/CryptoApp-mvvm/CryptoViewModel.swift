//
//  CryptoViewModel.swift
//  CryptoApp-mvvm
//
//  Created by Harun Gunes on 26/06/2022.
//

import Foundation

struct CryptoListViewModel {
  let cryptoList: [CryptoCurrency]
  
  
  func numberOfRowsInSection() -> Int {
    return self.cryptoList.count
  }
  
  
  func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
    let crypto = self.cryptoList[index]
    return CryptoViewModel(cryptoCurrency: crypto)
  }
}

struct CryptoViewModel {
  let cryptoCurrency: CryptoCurrency
  
  var name: String {
    return cryptoCurrency.currency
  }
  
  var price: String {
    return cryptoCurrency.price
  }
}
