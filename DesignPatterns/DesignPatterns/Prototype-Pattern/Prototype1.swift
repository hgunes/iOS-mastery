//
//  Prototype1.swift
//  DesignPatterns
//
//  Created by Harun Gunes on 14/07/2022.
//

import Foundation

class Player {
  
  let name: String
  let score: Int
  
  init(name: String, score: Int) {
    self.name = name
    self.score = score
  }
}

let player1 = Player(name: "Harun", score: 13)
let player2 = player1

print(player1.name)
print(player2.name)
