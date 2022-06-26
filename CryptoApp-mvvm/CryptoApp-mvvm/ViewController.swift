//
//  ViewController.swift
//  CryptoApp-mvvm
//
//  Created by Harun Gunes on 24/06/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  private var cryptoListViewModel: CryptoListViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    
    loadData()
  }
  
  
  func loadData() {
    NetworkService.shared.fetchCurrencies { result in
      if let result = result {
        self.cryptoListViewModel = CryptoListViewModel(cryptoList: result)
        
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
  }


  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cryptoListViewModel == nil ? 0 : cryptoListViewModel.numberOfRowsInSection()
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cryptocell", for: indexPath) as! CryptoTableViewCell
    
    let cryptoVM = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
    
    cell.nameLabel.text = cryptoVM.name
    cell.priceLabel.text = cryptoVM.price
    
    return cell
  }
}

