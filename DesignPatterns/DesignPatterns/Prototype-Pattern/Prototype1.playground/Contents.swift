import UIKit
import Foundation

class Player {
  
  var name: String
  var score: Int
  
  init(name: String, score: Int) {
    self.name = name
    self.score = score
  }
  
  func copy() -> Player {
    return Player(name: self.name, score: self.score)
  }
}

let player1 = Player(name: "Harun", score: 13)
let player2 = player1.copy()

//print(player1.name)
//print(player2.name)

player1.name = "Shady"

//print(player1.name)
//print(player2.name)

// MARK: - Example 1

class Money: NSObject, NSCopying { /// Apple standard way of using prototyping
  
  var id: Int
  var value: Double
  
  init(id: Int, value: Double) {
    self.id = id
    self.value = value
  }
  
  
  func copy(with zone: NSZone? = nil) -> Any {
    return Money(id: self.id, value: self.value)
  }
}

let money1 = Money(id: 1, value: 100)
let money2 = money1.copy() as! Money

//print(money1.value)
//print(money2.value)

money1.value = 200

//print(money1.value)
//print(money2.value)

// MARK: - Shallow & deep copy

class School: NSObject, NSCopying {
  
  var name: String
  var address: Location
  
  init(name: String, address: Location) {
    self.name = name
    self.address = address
  }
  
  /// Shallow copy
//  func copy(with zone: NSZone? = nil) -> Any {
//    return School(name: self.name, address: self.address)
//  }
  
  
  /// Deep copy
  func copy(with zone: NSZone? = nil) -> Any {
    return School(name: self.name, address: self.address.copy() as! Location)
  }
}

class Location: NSObject, NSCopying {
  
  var place: String
  
  init(place: String) {
    self.place = place
  }
  
  
  func copy(with zone: NSZone? = nil) -> Any {
    return Location(place: self.place)
  }
}

let school1 = School(name: "Ataturk Ilkokulu", address: Location(place: "Ilica"))
let school2 = school1.copy() as! School

print(school1.address.place)
print(school2.address.place)

school1.address.place = "Aziziye"

print(school1.address.place)
print(school2.address.place)
