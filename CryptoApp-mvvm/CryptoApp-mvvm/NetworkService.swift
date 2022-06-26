//
//  NetworkService.swift
//  CryptoApp-mvvm
//
//  Created by Harun Gunes on 26/06/2022.
//

import Foundation

class NetworkService {
  
  static let shared = NetworkService()
  
  private init() {}
  
  let endpoint = "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json"
  
  func fetchCurrencies(completion: @escaping ([CryptoCurrency]?) -> () ) {
    
    URLSession.shared.dataTask(with: URL(string: endpoint)!) { data, response, error in
      
      if let error = error {
        print(error.localizedDescription)
        completion(nil)
      } else if let data = data {
        
        let result = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        completion(result )
      }
    }.resume()
  }
}
